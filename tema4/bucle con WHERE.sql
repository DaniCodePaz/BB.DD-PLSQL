declare
 v_i number(2):= 1;
begin
 while v_i <= 10 loop
    dbms_output.put_line(v_i);
    v_i:=v_i+1;
 end loop;
end;
/