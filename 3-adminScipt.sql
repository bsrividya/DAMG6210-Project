
-- patient details
grant select on dmddhospitaladmin.patientdetails to doctor1;
grant SELECT on dmddhospitaladmin.patientdetails to patient1;
grant insert on dmddhospitaladmin.patientdetails to patient1;
grant update on dmddhospitaladmin.patientdetails to patient1;
grant select on dmddhospitaladmin.patientdetails to nurse1;
grant SELECT on dmddhospitaladmin.patientdetails to receptionist1;
grant insert on dmddhospitaladmin.patientdetails to receptionist1;
grant update on dmddhospitaladmin.patientdetails to receptionist1;
grant SELECT on dmddhospitaladmin.patientdetails to LabAssistant1;

-- report
grant select on dmddhospitaladmin.report to doctor1;
grant SELECT on dmddhospitaladmin.report to patient1;
grant select on dmddhospitaladmin.report to nurse1;
grant SELECT on dmddhospitaladmin.report to receptionist1;
grant select on dmddhospitaladmin.report to LabAssistant1;
grant INSERT on dmddhospitaladmin.report to LabAssistant1;
grant update on dmddhospitaladmin.report to LabAssistant1;

-- prescription
grant select on dmddhospitaladmin.prescription to doctor1;
grant insert on dmddhospitaladmin.prescription to doctor1;
grant update on dmddhospitaladmin.prescription to doctor1;
grant select on dmddhospitaladmin.prescription to patient1;
grant select on dmddhospitaladmin.prescription to nurse1;
grant select on dmddhospitaladmin.prescription to receptionist1;
grant select on dmddhospitaladmin.prescription to LabAssistant1;

-- appointment
grant select on dmddhospitaladmin.appointment to doctor1;
grant insert on dmddhospitaladmin.appointment to doctor1;
grant update on dmddhospitaladmin.appointment to doctor1;
grant select on dmddhospitaladmin.appointment to patient1;
grant select on dmddhospitaladmin.appointment to receptionist1;
grant insert on dmddhospitaladmin.appointment to receptionist1;
grant update on dmddhospitaladmin.appointment to receptionist1;

-- billing
grant select on dmddhospitaladmin.bill to patient1;
grant select on dmddhospitaladmin.bill to receptionist1;
grant insert on dmddhospitaladmin.bill to receptionist1;
grant update on dmddhospitaladmin.bill to receptionist1;
grant select on dmddhospitaladmin.bill to manager1;

-- employee
grant select on dmddhospitaladmin.employee to manager1;
grant select on dmddhospitaladmin.employee to nurse1;
grant select on dmddhospitaladmin.employee to receptionist1;
grant select on dmddhospitaladmin.employee to labassistant1;
grant select on dmddhospitaladmin.employee to pharmacist1;
grant select on dmddhospitaladmin.employee to manager1;
grant select on dmddhospitaladmin.employee to HR1;

-- lab master
grant select on dmddhospitaladmin.labmaster to labassistant1;
grant insert on dmddhospitaladmin.labmaster to labassistant1;
grant update on dmddhospitaladmin.labmaster to labassistant1;
grant select on dmddhospitaladmin.labmaster to receptionist1;

-- pharmacy master
grant select on dmddhospitaladmin.pharmacymaster to pharmacist1;
grant insert on dmddhospitaladmin.pharmacymaster to pharmacist1;
grant update on dmddhospitaladmin.pharmacymaster to pharmacist1;
grant select on dmddhospitaladmin.pharmacymaster to manager1;
grant insert on dmddhospitaladmin.pharmacymaster to manager1;
grant update on dmddhospitaladmin.pharmacymaster to manager1;

-- role master
grant select on dmddhospitaladmin.rolemaster to manager1;
grant select on dmddhospitaladmin.rolemaster to hr1;
grant insert on dmddhospitaladmin.rolemaster to hr1;
grant update on dmddhospitaladmin.rolemaster to hr1;

-- supplier master
grant select on dmddhospitaladmin.suppliermaster to pharmacist1;
grant insert on dmddhospitaladmin.suppliermaster to pharmacist1;
grant update on dmddhospitaladmin.suppliermaster to pharmacist1;
grant select on dmddhospitaladmin.suppliermaster to manager1;
grant insert on dmddhospitaladmin.suppliermaster to manager1;
grant update on dmddhospitaladmin.suppliermaster to manager1;

-- insurance master
grant select on dmddhospitaladmin.insurancemaster to patient1;
grant select on dmddhospitaladmin.insurancemaster to receptionist1;
grant select on dmddhospitaladmin.insurancemaster to manager1;
grant insert on dmddhospitaladmin.insurancemaster to patient1;
grant update on dmddhospitaladmin.insurancemaster to patient1;
grant insert on dmddhospitaladmin.insurancemaster to receptionist1;
grant update on dmddhospitaladmin.insurancemaster to receptionist1;

-- room
grant select on dmddhospitaladmin.room to doctor1;
grant select on dmddhospitaladmin.room to nurse1;
grant select on dmddhospitaladmin.room to receptionist1;
grant insert on dmddhospitaladmin.room to receptionist1;
grant update on dmddhospitaladmin.room to receptionist1;
grant select on dmddhospitaladmin.room to manager1;
grant insert on dmddhospitaladmin.room to manager1;
grant update on dmddhospitaladmin.room to manager1;


-- payroll
grant select on dmddhospitaladmin.payroll to doctor1;
grant select on dmddhospitaladmin.payroll to nurse1;
grant select on dmddhospitaladmin.payroll to receptionist1;
grant select on dmddhospitaladmin.payroll to labassistant1;
grant select on dmddhospitaladmin.payroll to pharmacist1;
grant select on dmddhospitaladmin.payroll to manager1;
grant select on dmddhospitaladmin.payroll to hr1;