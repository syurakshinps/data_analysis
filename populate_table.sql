-- Generate random operations data
DECLARE
  v_start_date TIMESTAMP := SYSTIMESTAMP - INTERVAL '3' MONTH;
  v_end_date TIMESTAMP := SYSTIMESTAMP;
  v_num_operations NUMBER := 10000;
  v_operation_names SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST(
    'operation0', 'operation1', 'operation2', 'operation3', 'operation4',
    'operation5', 'operation6', 'operation7', 'operation8', 'operation9'
  );
BEGIN
  FOR i IN 1..v_num_operations LOOP
    -- Generate a random datetime within the specified time span
    DECLARE
      v_random_interval INTERVAL DAY TO SECOND := INTERVAL '1' SECOND * DBMS_RANDOM.VALUE(0, EXTRACT(SECOND FROM v_end_date - v_start_date));
      v_random_days NUMBER := TRUNC(DBMS_RANDOM.VALUE(0, EXTRACT(DAY FROM v_end_date - v_start_date)));
      v_operation_datetime TIMESTAMP := v_start_date + INTERVAL '1' DAY * v_random_days + v_random_interval;
      v_random_index NUMBER := ROUND(DBMS_RANDOM.VALUE(1, v_operation_names.COUNT));
      v_operation_name VARCHAR2(255) := v_operation_names(v_random_index);
    BEGIN
      -- Insert the random data into the operations table
      INSERT INTO operations (datetime, operation_name)
      VALUES (v_operation_datetime, v_operation_name);
    END;
  END LOOP;
  COMMIT;
END;
/
