CREATE OR REPLACE PACKAGE PaqueteExamen AS
  FUNCTION cuantoTiempo RETURN NUMBER;
END PaqueteExamen;
/

CREATE OR REPLACE PACKAGE BODY PaqueteExamen AS
  v_fecha DATE;
  v_segundos NUMBER;
  
  FUNCTION cuantoTiempo RETURN NUMBER IS
  BEGIN
    IF v_fecha IS NULL THEN
      v_fecha := SYSDATE;
      v_segundos := 0;
    ELSE
      v_segundos := (SYSDATE - v_fecha) * 24 * 60 * 60;
      v_fecha := SYSDATE;
    END IF;
    
    RETURN v_segundos;
  END cuantoTiempo;
END PaqueteExamen;
/
