var bind_variable NUMBER

begin
 :bind_variable := 11;
end;
/

PRINT bind_variable;

SELECT count(*) FROM OFICIOEMPLEADO OE
WHERE empleado = :bind_variable;

