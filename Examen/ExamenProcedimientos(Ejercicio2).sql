CREATE OR REPLACE PACKAGE PaqueteExamen AS
  FUNCTION biestable RETURN NUMBER;
END PaqueteExamen;
/

CREATE OR REPLACE PACKAGE BODY PaqueteExamen AS
  v_estado NUMBER := 0;
  
  FUNCTION biestable RETURN NUMBER IS
  BEGIN
    IF v_estado = 0 THEN
      v_estado := 1;
    ELSE
      v_estado := 0;
    END IF;
    RETURN v_estado;
  END biestable;
END PaqueteExamen;
/
