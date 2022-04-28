create or replace procedure createRoles(roleName in varchar)
is roleId number default ROLEMASTERSEQUENCE.nextval;
begin
    insert into rolemaster values (roleId, upper(roleName));
    COMMIT;
end;
/

begin
    createroles('Doctor');
    createRoles('HR');
    createroles('Manager');
    createroles('Nurse');
    createroles('Receptionist');
    createroles('Pharmacist');
    createroles('LabAssistant');
end;
/

select * from roleMaster;