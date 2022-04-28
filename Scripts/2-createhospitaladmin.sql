-- create sequences
CREATE SEQUENCE appointmentSequence START WITH 1;
CREATE SEQUENCE billSequence START WITH 1;
CREATE SEQUENCE employeeSequence START WITH 1;
CREATE SEQUENCE insurancemasterSequence START WITH 1;
CREATE SEQUENCE labSequence START WITH 1;
CREATE SEQUENCE labMasterSequence START WITH 1;
CREATE SEQUENCE patientSequence START WITH 1;
CREATE SEQUENCE payrollSequence START WITH 1;
CREATE SEQUENCE pharmacyMasterSequence START WITH 1;
CREATE SEQUENCE prescriptionSequence START WITH 1;
CREATE SEQUENCE prescriptionMasterSequence START WITH 1;
CREATE SEQUENCE reportSequence START WITH 1;
CREATE SEQUENCE roleMasterSequence START WITH 1;
CREATE SEQUENCE roomSequence START WITH 1;
CREATE SEQUENCE supplierSequence START WITH 1;
CREATE SEQUENCE insuranceSequence START WITH 1;

-- create TABLES

-- appointment table
declare
v_sql LONG;
begin

v_sql:='create table appointment
  (
   "APPOINTMENTID" NUMBER(5) default appointmentSequence.nextVal NOT NULL,
       "PATIENTID" NUMBER(6) NOT NULL,
       "APPOINTMENTTYPE"  VARCHAR2(100),
       "REQUESTDATE" DATE,
       "APPOINTMENTTIME" DATE,
       "DOCTORID" NUMBER(5),
       "APPOINTMENTDESCRIPTION" VARCHAR2(300),
       CONSTRAINT "APPOINTMENT_PK" PRIMARY KEY ("APPOINTMENTID", "PATIENTID")
  )';
execute immediate v_sql;

EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE = -955 THEN
        NULL; -- suppresses ORA-00955 exception
      ELSE
         RAISE;
      END IF;
END; 
/

-- bill table
declare
v_sql LONG;
begin

v_sql:='
CREATE TABLE "BILL" 
   (	"BILLID" NUMBER(10) default billSequence.nextVal NOT NULL,
	"DOCTORFEE" NUMBER(*,0)NOT NULL, 
	"PHARMACYCHARGE" NUMBER(*,0)NOT NULL, 
	"ROOMCHARGE" FLOAT(126), 
	"OPTCHARGE" FLOAT(126), 
	"NOOFDAYS" NUMBER(*,0), 
	"MISCCHARGE" NUMBER(*,0), 
	"LABCHARGE" FLOAT(126), 
	"INSURANCENUMBER" NUMBER(*,0)NOT NULL, 
	"APPOINTMENTID" NUMBER(*,0)NOT NULL,
    CONSTRAINT "BILL_PK" PRIMARY KEY ("BILLID", "APPOINTMENTID") 
   )';
execute immediate v_sql;

EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE = -955 THEN
        NULL; -- suppresses ORA-00955 exception
      ELSE
         RAISE;
      END IF;
END; 
/


-- employee table
declare
v_sql LONG;
begin

v_sql:='
CREATE TABLE "EMPLOYEE" 
   (	"employeeid" NUMBER(10) default employeeSequence.nextVal NOT NULL, 
	"FNAME" VARCHAR2(20) NOT NULL, 
	"LNAME" VARCHAR2(20)NOT NULL, 
	"ADDRESS_1" VARCHAR2(100)NOT NULL, 
	"ADDRESS_2" VARCHAR2(20), 
	"CITY" VARCHAR2(20)NOT NULL, 
	"STATE" VARCHAR2(20)NOT NULL, 
	"ZIPCODE" VARCHAR2(20)NOT NULL, 
	"PHONE" VARCHAR2(20)NOT NULL, 
	"SPECC" VARCHAR2(20)NOT NULL, 
	"EMAIL" VARCHAR2(20)NOT NULL, 
	"PSWD" VARCHAR2(20)NOT NULL, 
	"ROLE_ID" NUMBER(*,0)NOT NULL, 
	"IS_ACTIVE" CHAR(1) NOT NULL,
    CONSTRAINT "EMPLOYEE_PK" PRIMARY KEY ("employeeid")
   )';
execute immediate v_sql;

EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE = -955 THEN
        NULL; -- suppresses ORA-00955 exception
      ELSE
         RAISE;
      END IF;
END; 
/

--insurance table
declare
v_sql LONG;
begin

v_sql:='
   CREATE TABLE "INSURANCE" 
   (	"ID" NUMBER(10) default insuranceSequence.nextVal NOT NULL, 
	"PATIENTID" NUMBER(*,0)NOT NULL, 
	"STARTDATE" DATE NOT NULL, 
	"ENDDATE" DATE NOT NULL, 
	"OPTICAL" VARCHAR2(20) NOT NULL,
    "Dental" VARCHAR2(20) NOT NULL,
	"MATERNITY" VARCHAR2(20 BYTE) NOT NULL, 
	"INSURANCECODE" NUMBER(*,0) NOT NULL,
    CONSTRAINT "INSURANCE_PK" PRIMARY KEY ("PATIENTID", "ID")
   )';
execute immediate v_sql;

EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE = -955 THEN
        NULL; -- suppresses ORA-00955 exception
      ELSE
         RAISE;
      END IF;
END; 
/

-- insurance master TABLE
declare
v_sql LONG;
begin

v_sql:='
    CREATE TABLE "INSURANCEMASTER" 
   (	"INSURANCECODE" NUMBER(10) default insurancemasterSequence.nextVal NOT NULL, 
	"PLAN" VARCHAR2(40)NOT NULL, 
	"COPAY" NUMBER(*,0)NOT NULL, 
	"COVERAGE" VARCHAR2(20)NOT NULL,
    CONSTRAINT "INSURANCEMASTER_PK" PRIMARY KEY ("INSURANCECODE")
   )';
execute immediate v_sql;

EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE = -955 THEN
        NULL; -- suppresses ORA-00955 exception
      ELSE
         RAISE;
      END IF;
END; 
/

--lab table
declare
v_sql LONG;
begin

v_sql:='
    CREATE TABLE "LAB" 
   (	"LABNUMBER" NUMBER(10) default labSequence.nextVal NOT NULL, 
	"EMPLOYEEID" NUMBER(*,0)NOT NULL, 
	"APPOINTMENTID" NUMBER(*,0)NOT NULL, 
	"TESTID" NUMBER(*,0)NOT NULL, 
	"HEIGHT" NUMBER(*,0)NOT NULL, 
	"WEIGHT" NUMBER(*,0)NOT NULL, 
	"BP" NUMBER(*,0)NOT NULL, 
	"TEMPERATURE" NUMBER(*,0)NOT NULL, 
	"TESTDATE" DATE NOT NULL, 
	"TESTRESULT" VARCHAR2(20) NOT NULL,
    CONSTRAINT "LAB_PK" PRIMARY KEY ("LABNUMBER", "APPOINTMENTID")
   )';
execute immediate v_sql;

EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE = -955 THEN
        NULL; -- suppresses ORA-00955 exception
      ELSE
         RAISE;
      END IF;
END; 
/

-- lab master table
declare
v_sql LONG;
begin

v_sql:='
    CREATE TABLE "LABMASTER" 
   (	"TEST_ID" NUMBER(10) default labMasterSequence.nextVal NOT NULL, 
	"TEST_COST" NUMBER(*,0) NOT NULL, 
	"NAME" VARCHAR2(20) NOT NULL,
    CONSTRAINT "LABMASTER_PK" PRIMARY KEY ("TEST_ID")
   )';
execute immediate v_sql;

EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE = -955 THEN
        NULL; -- suppresses ORA-00955 exception
      ELSE
         RAISE;
      END IF;
END; 
/

-- patient table
declare
v_sql LONG;
begin

v_sql:='
    CREATE TABLE "PATIENTDETAILS" 
   (	"PATIENTID" NUMBER(10) default patientSequence.nextVal NOT NULL, 
	"FIRSTNAME" VARCHAR2(20) NOT NULL, 
	"LASTNAME" VARCHAR2(20)NOT NULL, 
	"GENDER" VARCHAR2(20) NOT NULL, 
	"ADDRESS1" VARCHAR2(20) NOT NULL, 
	"ADDRESS2" VARCHAR2(20), 
	"CITY" VARCHAR2(20) NOT NULL, 
	"STATE" VARCHAR2(20) NOT NULL, 
	"ZIPCODE" VARCHAR2(20) NOT NULL, 
	"PHONE" VARCHAR2(20) NOT NULL, 
	"EMAIL" VARCHAR2(20) NOT NULL, 
	"DOB" DATE NOT NULL, 
	"PASSWORD" VARCHAR2(20) NOT NULL,
    CONSTRAINT "PATIENT_DETAILS_PK" PRIMARY KEY ("PATIENTID")
   )';
execute immediate v_sql;

EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE = -955 THEN
        NULL; -- suppresses ORA-00955 exception
      ELSE
         RAISE;
      END IF;
END; 
/

-- payroll table
declare
v_sql LONG;
begin

v_sql:='
    CREATE TABLE "PAYROLL" 
   (	"ID" NUMBER(10) default payrollSequence.nextVal NOT NULL, 
	"EMP_ID" NUMBER(*,0) NOT NULL, 
	"SAL" FLOAT(126) NOT NULL, 
	"BONUS" FLOAT(126) NOT NULL, 
	"ACC_NO" NUMBER(*,0)NOT NULL,
    CONSTRAINT "PAYROLL_PK" PRIMARY KEY ("ID", "EMP_ID")
   )';
execute immediate v_sql;

EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE = -955 THEN
        NULL; -- suppresses ORA-00955 exception
      ELSE
         RAISE;
      END IF;
END; 
/
-- pharmacy master table
declare
v_sql LONG;
begin

v_sql:='
    CREATE TABLE "PHARMACYMASTER" 
   (	"ID" NUMBER(10) default pharmacyMasterSequence.nextVal NOT NULL, 
	"MEDID" NUMBER(*,0) NOT NULL, 
	"COMPANY" VARCHAR2(150)NOT NULL, 
	"QUANTITY" NUMBER(*,0) NOT NULL, 
	"PRODUCEDDATE" DATE NOT NULL, 
	"EXPIRYDATE" DATE NOT NULL, 
	"SUPPLIERID" NUMBER(*,0)NOT NULL,
    CONSTRAINT "PHARMACYMASTER_PK" PRIMARY KEY ("ID")
   )';
execute immediate v_sql;

EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE = -955 THEN
        NULL; -- suppresses ORA-00955 exception
      ELSE
         RAISE;
      END IF;
END; 
/

-- prescription table
declare
v_sql LONG;
begin

v_sql:='
    CREATE TABLE "PRESCRIPTION" 
   (	"ID" NUMBER(10) default prescriptionSequence.nextVal NOT NULL, 
	"REPORTID" NUMBER(*,0), 
	"PHARMACYID" NUMBER(*,0),
    CONSTRAINT "PRESCRIPTION_PK" PRIMARY KEY("ID")
   )';
execute immediate v_sql;

EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE = -955 THEN
        NULL; -- suppresses ORA-00955 exception
      ELSE
         RAISE;
      END IF;
END; 
/

--prescriptionMaster table
declare
v_sql LONG;
begin

v_sql:='
   CREATE TABLE "PRESCRIPTIONMASTER" 
   (	"ID" NUMBER(10) default prescriptionMasterSequence.nextVal NOT NULL, 
	"NAME" VARCHAR2(100) NOT NULL, 
	"PRICE" number NOT NULL,
    CONSTRAINT "PRESCRIPTIONMASTER_PK" PRIMARY KEY ("ID")
   )';
execute immediate v_sql;

EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE = -955 THEN
        NULL; -- suppresses ORA-00955 exception
      ELSE
         RAISE;
      END IF;
END; 
/


-- report table
declare
v_sql LONG;
begin

v_sql:='
  CREATE TABLE "REPORT" 
   (	"REPORTID" NUMBER(10) default reportSequence.nextVal NOT NULL, 
	"APPOINTMENTID" NUMBER(*,0) NOT NULL, 
	"DIAGNOSIS" VARCHAR2(20000) NOT NULL , 
	"DOCTORID" NUMBER(*,0) NOT NULL,
   CONSTRAINT "REPORT_PK" PRIMARY KEY ("REPORTID")
   )';
execute immediate v_sql;

EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE = -955 THEN
        NULL; -- suppresses ORA-00955 exception
      ELSE
         RAISE;
      END IF;
END; 
/


-- role master TABLE
declare
v_sql LONG;
begin

v_sql:='
  CREATE TABLE "ROLEMASTER" 
   (	"ROLEID" NUMBER(10) default roleMasterSequence.nextVal NOT NULL, 
	"ROLENAME" VARCHAR2(50) NOT NULL ,
    CONSTRAINT "ROLEMASTER_PK" PRIMARY KEY ("ROLEID")
   )';
execute immediate v_sql;

EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE = -955 THEN
        NULL; -- suppresses ORA-00955 exception
      ELSE
         RAISE;
      END IF;
END; 
/

-- room table
declare
v_sql LONG;
begin

v_sql:='
  CREATE TABLE "ROOM" 
   (	"ROOM_ID" NUMBER(10) default roomSequence.nextVal NOT NULL, 
	"CATEGORY" VARCHAR2(20), 
	"STATUS" VARCHAR2(20), 
	"BEDCOUNT" NUMBER(*,0)
   )';
execute immediate v_sql;

EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE = -955 THEN
        NULL; -- suppresses ORA-00955 exception
      ELSE
         RAISE;
      END IF;
END; 
/

-- supplier master table
declare
v_sql LONG;
begin

v_sql:='
  CREATE TABLE "SUPPLIERMASTER" 
   (	"SUPPLIERID" NUMBER(10) default supplierSequence.nextVal NOT NULL, 
	"NAME" VARCHAR2(100) NOT NULL, 
	"PHONE" VARCHAR2(20) NOT NULL, 
	"EMAIL" VARCHAR2(50) NOT NULL, 
	"ADDRESS_1" VARCHAR2(100) NOT NULL, 
	"ADDRESS_2" VARCHAR2(20), 
	"CITY" VARCHAR2(20) NOT NULL, 
	"STATE" VARCHAR2(20) NOT NULL, 
	"ZIPCODE" VARCHAR2(20) NOT NULL,
    CONSTRAINT "SUPPLIERMASTER_PK" PRIMARY KEY ("SUPPLIERID")
   )';
execute immediate v_sql;

EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE = -955 THEN
        NULL; -- suppresses ORA-00955 exception
      ELSE
         RAISE;
      END IF;
END; 
/



-- create ROLE
CREATE OR REPLACE PROCEDURE create_role( role_name IN VARCHAR2 ) IS
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  EXECUTE IMMEDIATE 'CREATE ROLE '||role_name;
EXCEPTION
  WHEN OTHERS THEN
    -- ORA-01921: If The role name exists, ignore the error.
    IF SQLCODE <> -01921 THEN
      RAISE;
    END IF;
END create_role;
/

begin
Create_role('Doctor');
Create_role('Patient');
Create_role('Nurse');
Create_role('Receptionist');
Create_role('Pharmacist');
Create_role('LabAssistant');
Create_role('Manager');
Create_role('HR');
end;
/


