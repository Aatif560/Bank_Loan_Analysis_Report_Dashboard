/* Summary Dashboard*/

/* Check The table */

select * from Bank_loan_data;

/* Total Loan Applications*/

select count(id)AS Total_Loan_Applications from Bank_loan_data;


/* MTD Loan Applications */

select count(id)AS MTP_Loan_Applications from Bank_loan_data Where MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;


/* Previous Month */
select count(id)AS PMTD_Loan_Applications from Bank_loan_data Where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;


/*Total Funded Amount*/

select sum(loan_amount) AS Total_Funded_Amount From Bank_loan_data;


/*Month To Date Total Funded Amount*/

select sum(loan_amount) AS MTD_Total_Funded_Amount From Bank_loan_data Where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021;

/*Previou Month To Date Total Funded Amount*/

select sum(loan_amount) AS PMTD_Total_Funded_Amount From Bank_loan_data Where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021;


/* Total Amount Received */

select sum(total_payment) As total_Amount_Received from Bank_loan_data;


/* current Month Amount Received */

select sum(total_payment) As MTD_total_Amount_Received from Bank_loan_data where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021;

/* Previous Month Amount Received */

select sum(total_payment) As PMTD_total_Amount_Received from Bank_loan_data where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021;


/* Average Intrest Rate */

select Round(AVG(int_rate),4) *100 as Avg_Interest_Rate from Bank_loan_data;

/* MTD Average Intrest Rate */

select Round(AVG(int_rate),4) *100 as MTD_Avg_Interest_Rate from Bank_loan_data where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021;

/* PMTD Average Intrest Rate */

select Round(AVG(int_rate),4) *100 as PMTD_Avg_Interest_Rate from Bank_loan_data where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021;


/* Average Debt to Income Ratio */


select Round(AVG(dti),4) *100  as Avg_DTI From Bank_loan_data;


/* MTD Average Debt to Income Ratio */


select Round(AVG(dti),4) *100  as MTP_Avg_DTI From Bank_loan_data where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021;

/* PMTD Average Debt to Income Ratio */


select Round(AVG(dti),4) *100  as PMTD_Avg_DTI From Bank_loan_data where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021;



/* Good Loan */

 select	
	(count( CASE WHEN loan_status = 'Fully Paid'  or loan_status = 'Current' then id END)* 100)/
	count(id) as Good_loan_Percentage from Bank_loan_data;



/* Good Loan Applications */


select COUNT(id) AS Good_Loan_Applications FROM Bank_loan_data WHERE loan_status = 'Fully Paid' or loan_status = 'Current';


/* Good Loan Funded Amount */


select sum(loan_amount) as Good_Loan_Funded_Amount FROM Bank_loan_data WHERE loan_status = 'Fully Paid' or loan_status = 'Current';


/* Good Loan total Received Amount */

select sum(total_payment) as Good_Loan_total_Received_Amount FROM Bank_loan_data WHERE loan_status = 'Fully Paid' or loan_status = 'Current';


/* Bad Loan */

select 
	  (COUNT(CASE WHEN loan_status = 'Charged Off' Then id END) * 100.0)/
	  COUNT(id) AS Bad_Loan_Percentage FROM Bank_loan_data;




/* Bad Loan Applications */

select COUNT(id) as bank_load_Applications From Bank_loan_data where loan_status = 'Charged Off';

/* Bad Loan Funded Amount */

select sum(loan_amount) as Bad_loan_Funded_Amount From Bank_loan_data where loan_status = 'Charged Off';


/* Bad Loan  Amount Received*/

select sum(total_payment) as Bad_loan_Amount_Received From Bank_loan_data where loan_status = 'Charged Off';

/* Loan Status Grid View */

select 
		loan_status,
		COUNT(id) AS Total_Applications,
		SUM(total_payment) AS Total_Amount_Received,
		SUM(loan_amount) AS Total_Funded_Amount,
		AVG(int_rate*100) AS Interest_Rate,
		AVG(dti *100) AS DTI

	FROM Bank_loan_data
	GROUP BY
			loan_status;

/*	Month to date total Amount */

select
		loan_status,
		SUM(total_payment) as MTP_Total_amount_received,
		SUM(loan_amount) as MTP_Total_funded_amount
		from Bank_loan_data where MONTH(issue_date) = 12 Group by loan_status;


/*	Previous Month to date total Amount */

select
		loan_status,
		SUM(total_payment) as PMTP_Total_amount_received,
		SUM(loan_amount) as PMTP_Total_funded_amount
		from Bank_loan_data where MONTH(issue_date) = 11 Group by loan_status;

/* Overview Dashboard */

select * from Bank_loan_data;


/* Monthly Traits */
select 
		MONTH(issue_date) AS Month_Number,
		DATENAME(month, issue_date)as Month_Name,
		COUNT(id) AS Total_loan_Applications,
		sum(loan_amount) AS Total_Amount_Funded,
		sum(total_payment) AS Total_Amount_Received
		from Bank_loan_data	
		group by MONTH(issue_date),DATENAME(month, issue_date)
		order by MONTH(issue_date);


/* Regional Analysis By State */

select 
		address_state,
		COUNT(id) AS Total_loan_Applications,
		sum(loan_amount) AS Total_Amount_Funded,
		sum(total_payment) AS Total_Amount_Received
		from Bank_loan_data	
		group by address_state 
		order by count(id) DESC;


/* Loan Term Analysis */

select 
		term,
		COUNT(id) AS Total_loan_Applications,
		sum(loan_amount) AS Total_Amount_Funded,
		sum(total_payment) AS Total_Amount_Received
		from Bank_loan_data	
		group by term 
		order by term;


/* Employee Name */

select
		emp_length,
		COUNT(id) AS Total_loan_Applications,
		sum(loan_amount) AS Total_Amount_Funded,
		sum(total_payment) AS Total_Amount_Received
		from Bank_loan_data	
		group by emp_length 
		order by COUNT(id) DESC;

	  
/* Loan purpose breakdowm */

select
		purpose,
		COUNT(id) AS Total_loan_Applications,
		sum(loan_amount) AS Total_Amount_Funded,
		sum(total_payment) AS Total_Amount_Received
		from Bank_loan_data	
		group by purpose
		order by COUNT(id) DESC;


			  
/* Home Owership Analysis */

select
		home_ownership,
		COUNT(id) AS Total_loan_Applications,
		sum(loan_amount) AS Total_Amount_Funded,
		sum(total_payment) AS Total_Amount_Received
		from Bank_loan_data	
		group by home_ownership
		order by COUNT(id) DESC;	