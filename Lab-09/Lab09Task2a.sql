CREATE OR REPLACE
PROCEDURE NRichestBranches(N IN NUMBER)
AS
    MAX_ROW number;
BEGIN
    SELECT max(ROWNUM) INTO MAX_ROW FROM (SELECT * FROM branch ORDER BY assets DESC);
    IF(N>MAX_ROW) THEN
        DBMS_OUTPUT.PUT_LINE('N Exceeds the number of records');
        RETURN;
    END IF;
    FOR i IN (SELECT * FROM (SELECT * FROM branch ORDER BY assets DESC) WHERE ROWNUM<=N) LOOP
        DBMS_OUTPUT.PUT_LINE(i.branch_name || ' ' || i.branch_city || ' ' || i.assets);
    END LOOP;

END;
/
DECLARE
    NUM NUMBER;
BEGIN
    NUM:='&number';
    NRichestBranches(NUM);
END;
/