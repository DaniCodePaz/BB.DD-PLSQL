DECLARE
    v_oficio Oficio%rowtype;
    --Variable de acoplamiento utilizada en la consulta
    CURSOR c_Oficio IS
        SELECT *
        FROM Oficio;
    PROCEDURE Print(p_Oficio Oficio%rowtype) is
    BEGIN
        dbms_output.put_line(p_Oficio.numoficio);
        dbms_output.put_line(p_Oficio.Oficio);
        --Así con el resto de campos
    END;
BEGIN
    OPEN c_Oficio;
    LOOP
        FETCH c_Oficio INTO v_oficio;
        EXIT WHEN c_Oficio%NOTFOUND;
        Print(v_oficio);
    END LOOP;
    CLOSE c_Oficio;
END;
/