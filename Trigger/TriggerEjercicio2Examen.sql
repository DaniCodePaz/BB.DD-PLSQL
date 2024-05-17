create or replace trigger empleadoC
before insert or update of Oficio on Oficio
for each row
begin
    :new.oficio:= upper(trim(:new.oficio));
end;
/
