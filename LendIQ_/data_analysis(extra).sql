-- How many loans are there by grade
select loans.grade, count(*) as loan_count from loans
group by loans.grade
order by loans.grade;

-- Average interest rate by grade
select loans.grade, round(avg(int_rate)::numeric, 2) as avg_interest_rate from loans
group by loans.grade
order by loans.grade;

-- States that have the most borrowers
select addr_state, count(*) as num_borrowers from borrowers 
group by addr_state
order by num_borrowers desc;

-- Breakdown of loan status (fully paid vs default vs current)
select loan_status, count(loan_status) as loan_count from loans
group by loan_status
order by loan_count desc;

-- Default rate by loan grade
select grade, round(avg(case 
		when loan_status in ('Charged Off', 'Default') then 1 
		else 0 
	end)::numeric, 4) as default_rate
from loans
group by grade
order by grade;

-- Loan purposes with highest default rate
select purpose, count (*) as loan_count, 
	   round(avg(case 
		 when loan_status in ('Charged Off', 'Default') then 1 
		 else 0 
	   end)::numeric, 4) as default_rate,
	   sum(case
	   	 when loan_status in ('Charged Off', 'Default') then 1
	   	 else 0
	   	 end) as default_count
from loans 
group by loans.purpose 
order by default_rate desc;

-- Debt-to-income ratio vs default
select
	case 
		when dti < 10 then 'Low (0-10)'
		when dti < 20 then 'Medium (10-20)'
		when dti < 30 then 'High (20-30)'
		else 'Very High (30+)'
	end as dti_bucket,
	count(*) as loan_count,
	round(avg(case 
		when loan_status in ('Charged Off', 'Default') then 1 else 0
	end)::numeric, 4) as default_rate
from credit_profile 
left join loans 
	on credit_profile.loan_id = loans.loan_id 
group by dti_bucket 
order by default_rate desc;

-- Employment length with the worst repayments
select emp_length, count(*) as loan_count,
	round(avg(case 
		when loan_status in ('Charged Off', 'Default') then 1 else 0
	end)::numeric, 4) as default_rate 
from borrowers
left join loans
	on loans.loan_id = borrowers.loan_id
group by emp_length
order by default_rate desc;

-- how default rate changed month over month (mom) (using window function: lag)
with monthly_defaults as (
	select 
		date_trunc('month', issue_d) as month,
		round(avg(case 
			when loan_status in ('Charged Off', 'Default') then 1 else 0
		end)::numeric, 4) as default_rate
	from loans
	group by date_trunc('month', issue_d)
)
select month, default_rate, 
	lag(default_rate) over (order by month) as prev_month_rate,
	round(default_rate - lag(default_rate) over (order by  month), 4) as mom_change
from monthly_defaults 
order by month;

-- rolling three months default rate by grade (using AVG in windows functions)
with monthly_defaults as (
	select
		grade,
		date_trunc('month', issue_d) as month,
		round(avg(case 
			when loan_status in ('Charged Off', 'Default') then 1 else 0
		end)::numeric, 4) as default_rate
	from loans
	group by grade, date_trunc('month', issue_d)
)
select 
	grade, month, default_rate,
	avg(default_rate) over (partition by grade order by month rows between 2 preceding and current row) as rolling_3mnths_default_rate
from monthly_defaults
order by grade, month;

-- Rank states by default rate within each grade
WITH state_defaults AS (
    SELECT 
        borrowers.addr_state,
        loans.grade,
        ROUND(AVG(CASE
                    WHEN loans.loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0
                  END)::numeric, 4) AS default_rate
    FROM borrowers
    LEFT JOIN loans ON borrowers.loan_id = loans.loan_id
    GROUP BY borrowers.addr_state, loans.grade
)
SELECT addr_state, grade, default_rate,
    RANK() OVER (PARTITION BY grade ORDER BY default_rate DESC) AS state_rank
FROM state_defaults
ORDER BY grade, state_rank;

-- Which borrower decile by income has the worst default rate
WITH borrower_deciles AS (
    SELECT loan_id, annual_inc,
           NTILE(10) OVER (ORDER BY annual_inc) AS income_decile
    FROM borrowers
)
SELECT income_decile,
    ROUND(AVG(CASE
                WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0
              END)::numeric, 4) AS default_rate
FROM borrower_deciles
LEFT JOIN loans ON borrower_deciles.loan_id = loans.loan_id
GROUP BY income_decile
ORDER BY income_decile;

-- Vintage analysis: do loans issued in 2015 default more than 2017
SELECT
    DATE_TRUNC('year', issue_d) AS year,
    COUNT(*) AS loan_count,
    ROUND(AVG(CASE
                WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0
              END)::numeric, 4) AS default_rate
FROM loans
GROUP BY DATE_TRUNC('year', issue_d)
ORDER BY year;



 