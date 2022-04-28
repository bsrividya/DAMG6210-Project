-- create appointment
begin
    createappointment(1, 'Physical/Check Up', '16-Jan-2022','16-Jan-2022 09:00', 3, 'Marginal corneal ulcer, bilateral');
end;
/


begin
addPrescription(5, 4);
addPrescription(5, 12);
end;