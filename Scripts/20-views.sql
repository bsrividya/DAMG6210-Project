create or replace view diminishingInventory as 
select p.medid, p.company, p.quantity, p.produceddate, p.expirydate, s.supplierid, 
s.name, s.phone, s.email, s.address_1, s.address_2, s.city, s.state, s.zipcode from pharmacymaster p inner join suppliermaster s on p.supplierid = s.supplierid order by quantity;


create or replace view patientDocument AS
select r.reportId, r.appointmentId, r.DIAGNOSIS, r.DOCTORID, p.PHARMACYID, pm.name, pm.PRICE
from report r inner join prescription p on r.reportId = p.reportId
inner join prescriptionmaster pm on p.pharmacyId = pm.id

create or replace view HRView AS
select * from employee inner join payroll on employee."employeeid" = payroll.emp_id;