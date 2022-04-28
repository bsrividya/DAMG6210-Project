Alter table appointment add constraint fk_patientId foreign key (patientId) references PATIENTDETAILS(patientId) on delete cascade;
--Alter table appointment add constraint fk_doctorId foreign key (DOCTORID) references EMPLOYEE(employeeid) on delete cascade;
Alter table employee add constraint fk_roleId foreign key (ROLE_ID) references rolemaster(roleid) on delete cascade;
Alter table pharmacymaster add constraint fk_supplierId foreign key (supplierid) references suppliermaster(supplierid) on delete cascade;
--Alter table lab add constraint fk_appointmentid_lab foreign key (APPOINTMENTID) references appointment(APPOINTMENTID) on delete cascade;
Alter table lab add constraint fk_testid foreign key (testid) references labmaster(test_id) on delete cascade;
--Alter table bill add constraint fk_patientId_Bill foreign key (appointmentid) references appointment(appointmentid) on delete cascade;
Alter table insurance add constraint fk_insuranceCode foreign key (insuranceCode) references insurancemaster (insuranceCode) on delete cascade;
--Alter table payroll add constraint fk_employeeid foreign key (EMP_ID) references employee(employeeid) on delete cascade;

