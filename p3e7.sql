use practica2;
DROP PROCEDURE if exists contar_directores;

set @num_llamadas:=0;

DELIMITER //
CREATE PROCEDURE contar_directores()
BEGIN
  DECLARE num_dirs INT;
  DECLARE fecha datetime;
  
  set num_dirs = (select count(*) from directores);
  set fecha = (CURRENT_TIMESTAMP);
  
  create table if not exists cuentaDirectores(
	fecha datetime,
	num_directores integer,
	primary key (fecha,num_directores)
  );
  
  insert into cuentaDirectores values (fecha,num_dirs);
  set @num_llamadas = @num_llamadas + 1;
  
  IF (select count(*) from cuentaDirectores) > 10 THEN
	delete from cuentaDirectores limit 1;
  END IF;
  
END //
DELIMITER ;

CALL contar_directores();
select * from cuentaDirectores;
select @num_llamadas;