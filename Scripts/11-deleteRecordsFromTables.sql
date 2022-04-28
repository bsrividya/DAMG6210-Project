create or replace procedure deleteAppointment
(
    pId in number,
    aId in number
)
is
BEGIN
    delete from appointment where patient_id = pId and appointmentId = aId;
END;
/

create or replace PROCEDURE viewBill
(
    pId in number,
    aId in number
)
is
eCount NUMBER;
begin
    select count(*) into eCount from Bill where patient_id = pId and appointmentId = aId;
    if eCount > 0 THEN
    select P.patient_id from Bill B
    inner join 
    Insurance on 


create or replace PROCEDURE makeEmployeeInactive
(
    eId in number
)
is 
begin
    update employee set IS_ACTIVE = 0 where employeeId = eId;
end;
/

-- create or replace procedure updateEmployeeDetails
-- (
--     eId in number,
--     fName in varchar2,
--     lName in varchar2,
--     eaddress1 in varchar2,
--     eAddress2 in varchar2,
--     ePhone in varchar2,
--     eEmail in varchar2,
--     ePassword in varchar2
-- )
