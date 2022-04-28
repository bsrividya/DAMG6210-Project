create or REPLACE procedure createLabMasterRecords
(
    testCost in number,
    testName in varchar2
)
is
tid number default labMasterSequence.nextval;
begin
    insert into lab_master values(tid,testCost,testName);
end;