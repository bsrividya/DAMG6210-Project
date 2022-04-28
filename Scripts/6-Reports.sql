BEGIN
dbms_output.put_line('List of appointments for the day');
dbms_output.put_line('----------------------------------');
END;
/
select * from appointment where appointmenttime = TO_DATE('13-APR-22','dd-MON-yy')

BEGIN
dbms_output.put_line('Infection reports');
END;
/
select * from report where diagnosis like '%INFECTION%';


BEGIN
dbms_output.put_line('List of insurances with copay higher than 2000.');
END;
/
select * from insurancemaster where coverage > 2000;


BEGIN
dbms_output.put_line('List of medicines with supplied less than 50');
END;
/
select * from pharmacymaster where quantity < 50;


BEGIN
dbms_output.put_line('List of Doctors in Different Specialization');
END;
/
SELECT specc, COUNT(*)
  FROM employee
  GROUP BY specc;

BEGIN
dbms_output.put_line('List of Active Employees');
END;
/
  SELECT count(*) FROM EMPLOYEE
WHERE IS_ACTIVE = 1