-- create hospital admin user via default admin
declare
userexist integer;
begin
    select count(*) into userexist from dba_users where username='DMDDHOSPITALADMIN';
    if (userexist = 0) then
        execute immediate 'create user DMDDHospitalAdmin identified by Mobile7612345';
        execute immediate 'grant create session to DMDDHospitalAdmin';
        execute immediate 'grant create table, create view, create procedure, create sequence to DMDDHospitalAdmin';
        execute immediate 'GRANT UNLIMITED TABLESPACE TO DMDDHospitalAdmin';
        execute IMMEDIATE 'grant create user to DMDDHospitalAdmin';
        execute immediate 'grant create role to dmddhospitaladmin';
        execute immediate 'grant select on dba_users to dmddhospitaladmin';
        execute immediate 'grant drop user to dmddhospitaladmin';
    end if;
end;
/

-- create doctor
declare 
userexist integer;
BEGIN
    select count(*) into userexist from dba_users where username='DOCTOR1';
    if (userexist = 0) THEN
        execute immediate 'create user doctor1 identified by Mobile7612345';
        execute immediate 'grant create session to doctor1';
    end if;
END;
/
-- create patient
declare 
userexist integer;
BEGIN
    select count(*) into userexist from dba_users where username='PATIENT1';
    if (userexist = 0) THEN
        execute immediate 'create user patient1 identified by Mobile7612345';
        execute immediate 'grant create session to patient1';
    end if;
END;
/
-- create nurse
declare 
userexist integer;
BEGIN
    select count(*) into userexist from dba_users where username='NURSE1';
    if (userexist = 0) THEN
        execute immediate 'create user nurse1 identified by Mobile7612345';
        execute immediate 'grant create session to nurse1';
    end if;
END;
/
-- create receptionist
declare 
userexist integer;
BEGIN
    select count(*) into userexist from dba_users where username='RECEPTIONIST1';
    if (userexist = 0) THEN
        execute immediate 'create user receptionist1 identified by Mobile7612345';
        execute immediate 'grant create session to receptionist1';
    end if;
END;
/
-- create pharmacist
declare 
userexist integer;
BEGIN
    select count(*) into userexist from dba_users where username='PHARMACIST1';
    if (userexist = 0) THEN
        execute immediate 'create user pharmacist1 identified by Mobile7612345';
        execute immediate 'grant create session to pharmacist1';
    end if;
END;
/
-- create labassistant
declare 
userexist integer;
BEGIN
    select count(*) into userexist from dba_users where username='LABASSISTANT1';
    if (userexist = 0) THEN
        execute immediate 'create user labassistant1 identified by Mobile7612345';
        execute immediate 'grant create session to labassistant1';
    end if;
END;
/
-- create manager
declare 
userexist integer;
BEGIN
    select count(*) into userexist from dba_users where username='MANAGER1';
    if (userexist = 0) THEN
        execute immediate 'create user manager1 identified by Mobile7612345';
        execute immediate 'grant create session to manager1';
    end if;
END;
/
-- create HR
declare 
userexist integer;
BEGIN
    select count(*) into userexist from dba_users where username='HR1';
    if (userexist = 0) THEN
        execute immediate 'create user HR1 identified by Mobile7612345';
        execute immediate 'grant create session to HR1';
    end if;
END;
/


