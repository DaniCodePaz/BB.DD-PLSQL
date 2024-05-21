CREATE OR REPLACE TRIGGER asignar_alojamiento
BEFORE INSERT ON Empleado
FOR EACH ROW
DECLARE
    v_alojamiento Alojamiento.numaloj%TYPE;
BEGIN
    IF :NEW.numaloj IS NULL THEN
        SELECT numaloj INTO v_alojamiento
        FROM (
            SELECT numaloj, COUNT(*) AS num_empleados
            FROM Alojamiento
            LEFT JOIN Empleados ON Alojamiento.numaloj = Empleados.numaloj
            GROUP BY Alojamiento.numaloj
            ORDER BY num_empleados ASC
        ) WHERE ROWNUM = 1;

        :NEW.numaloj := v_alojamiento;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Manejar el caso en que no hay alojamientos disponibles
        NULL;
END;
/