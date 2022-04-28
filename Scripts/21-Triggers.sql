create or replace TRIGGER reoprt_bill_tr AFTER
    UPDATE OF DIAGNOSIS ON report
   FOR EACH ROW
DECLARE
    rec_count NUMBER;
     PRAGMA AUTONOMOUS_TRANSACTION;    
BEGIN
   -- determine the transaction type
    SELECT
        COUNT(*)
    INTO rec_count
    FROM
        bill
    WHERE
        appointmentid = :old.appointmentid;

    IF ( rec_count = 0 ) THEN
        createbill(400, 0, 0, 0, 0,
                  0, 0, 0, :old.appointmentid);

    ELSE
        UPDATE bill
        SET
            doctorfee = 400
        WHERE
            appointmentid = :old.appointmentid;

    END IF;
END;


create or replace TRIGGER prescription_bill_tr AFTER
    INSERT ON PRESCRIPTION
   FOR EACH ROW
DECLARE
    APTID NUMBER;
    sumPrice NUMBER;
    PRAGMA AUTONOMOUS_TRANSACTION;    
BEGIN
   -- determine the transaction type
    SELECT
        rp.APPOINTMENTID
    INTO APTID
    FROM
        REPORT rp
    WHERE
        rp.reportid = :new.reportid;
        
   SELECT
        sum(pm.PRICE)
    INTO sumPrice
    FROM
        PRESCRIPTIONMASTER pm
    WHERE
         pm.id = APTID;     
    
    update BILL set PHARMACYCHARGE = sumPrice where APPOINTMENTID = APTID;
    commit;
END;
/



create or replace TRIGGER lab_bill_tr AFTER
    INSERT ON LAB
   FOR EACH ROW
DECLARE
    sumPrice NUMBER;
    PRAGMA AUTONOMOUS_TRANSACTION;    
BEGIN
   -- determine the transaction type
        
   SELECT
        sum(lm.test_Cost)
    INTO sumPrice
    FROM
        labmaster lm
    WHERE
         lm.TEST_ID = :new.testId;     
    
    update BILL set LABCHARGE = sumPrice where APPOINTMENTID = :new.APPOINTMENTID;
    commit;
END;
/