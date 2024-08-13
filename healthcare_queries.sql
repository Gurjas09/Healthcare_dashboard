Create table HealthCare
(
	Patient_Name varchar(50),
	age int,
	Gender varchar(50),
	Blood_Type varchar(50),
	Medical_Condition varchar(50),
	Date_of_Admission date,
	Doctor varchar(50),
	Hospital varchar(50),
	Insurance_Provider varchar(50),
	 Billing_Amount DECIMAL(10,2),
	Room_Number int,
	Admission_Type varchar(50),
	Discharge_Date date,
	Medication varchar(50),
	Test_Results varchar(50)
);

drop table healthcare;

Copy healthcare
FROM 'D:\Data analytics\Projects\Healthcare\healthcare_dataset.csv'
DELIMITER ','
CSV HEADER

Select * from healthcare;

Select medical_condition,count(patient_name) as total_patient
from healthcare
group by medical_condition
order by total_patient desc;


Select * from healthcare
where age>=60
order by age asc;

Select hospital,sum(billing_amount)
from healthcare
group by hospital;

Select patient_name from healthcare
where medication ='Ibuprofen';


Select blood_type,count(patient_name) as name
from healthcare
group by blood_type
order by name desc

Select patient_name, date_of_admission
from healthcare 
where extract(YEAR FROM date_of_admission)='2023';

Select admission_type,count(medical_condition)
from healthcare
group by admission_type


--Doctor who treated the most cancer patients
Select doctor,count(*) as patients
from healthcare
where medical_condition='Cancer'
group by doctor
order by patients desc
Limit 1;

SELECT 
 (COUNT(CASE WHEN Test_Results = 'Abnormal' THEN 1 END) * 100.0 / COUNT(*)) as Abnormal_Percentage
FROM healthcare;

