CREATE OR REPLACE FUNCTION setOficio(p_Oficio Oficio%rowtype) RETURN BOOLEAN IS
v_count NUMBER;
BEGIN
 SELECT count(*) INTO v_count 
 FROM Oficio 
 WHERE numoficio = p_Oficio.numoficio;
 
 IF v_count > 0 THEN
 UPDATE Oficio SET oficio = p_Oficio.oficio WHERE numoficio = p_Oficio.numoficio;
 RETURN TRUE;
 ELSE
 RETURN FALSE;
 END IF;
END setOficio;
/