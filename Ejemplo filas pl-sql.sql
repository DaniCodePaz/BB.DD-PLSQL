CREATE OR REPLACE PROCEDURE empleados (aloj Empleado.alojamiento%type) IS
    CURSOR c_filas IS 
        SELECT * FROM Empleado
        WHERE alojamiento = 4;
    v_fila Empleado%rowtype;
BEGIN
    OPEN c_filas
    LOOP
        FETCH c_filas INTO v_fila;
        dbms_output.put_line(v_fila.nombre || ' -> ' || v_fila.sueldo);
        EXIT WHEN c_filas%NOTFOUND;
    END LOOP;
    CLOSE c_filas;
END;