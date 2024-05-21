DECLARE
    FUNCTION registrosTabla (p_table IN VARCHAR2) RETURN NUMBER IS
        v_Registros NUMBER(5);
        v_sql VARCHAR2(1000);
    BEGIN
        v_sql := 'SELECT COUNT(*) FROM ' || p_table;
        EXECUTE IMMEDIATE v_sql INTO v_Registros;
        RETURN v_Registros;
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -942 THEN
                RETURN -1;
            END IF;
    END registrosTabla;

--Casos de prueba
BEGIN
    -- Prueba 1: Tabla EMPLEADO
    DECLARE
        v_table VARCHAR2(30) := 'EMPLEADO';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Número de registros: ' || TO_CHAR(registrosTabla(v_table)));
    END;

    -- Prueba 2: Tabla inexistente
    DECLARE
        v_table VARCHAR2(30) := 'TablaInexistente';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Número de registros: ' || TO_CHAR(registrosTabla(v_table)));
    END;
END;
/
