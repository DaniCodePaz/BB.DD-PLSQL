declare
 v_i number(1);
begin
 for v_i in 1..10 loop
    dbms_output.put_line(v_i);
 end loop;
end;
/