CREATE OR REPLACE TRIGGER asignar_alojamiento
BEFORE INSERT ON Empleado
FOR EACH ROW
DECLARE
  alojamiento_id NUMBER;
BEGIN
  SELECT numaloj
  INTO alojamiento_id
  FROM (
    SELECT a.numaloj, COUNT(e.numemp) AS num_empleados
    FROM Alojamiento a
    LEFT JOIN Empleado e ON a.numaloj = e.Alojamiento 
    group by a.numaloj
    ORDER BY num_empleados ASC, a.numaloj ASC
    FETCH FIRST ROW ONLY
  );
  
  IF alojamiento_id IS NULL THEN
    SELECT MIN(numaloj) INTO alojamiento_id FROM Alojamiento;
  END IF;
  
  :NEW.Alojamiento := alojamiento_id;
END asignar_alojamiento;
/

