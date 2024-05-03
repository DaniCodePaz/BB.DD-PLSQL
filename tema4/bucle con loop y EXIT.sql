declare
 v_i number(2):= 1;
 v_MAX constant number(2):=10;
begin
 loop
    dbms_output.put_line(v_i);
    v_i:=v_i+1;
    if v_i > v_MAX then
        exit;
    end if;    
 end loop;
end;
/