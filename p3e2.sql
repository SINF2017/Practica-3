/*
DECLARE @nombreVar -> user-defined variables
DECLARE nombreVar -> Local variables
DECLARE @@nombreVar -> Server System Variables
*/
/* 
source C:\Users\Sara\Desktop\p3e2.sql
show procedure status;
*/

use practica2;
DROP PROCEDURE if exists contar_directores;

DELIMITER //
CREATE PROCEDURE contar_directores()
BEGIN
  DECLARE num_dirs INT;
  DECLARE fecha datetime;
  
  set num_dirs = (select count(*) from directores);
  set fecha = (CURRENT_TIMESTAMP);
  
  /*
  select count (*) into num_dirs from directores;
  select CURRENT_TIMESTAMP() into fecha;
  */
  
  create table if not exists cuentaDirectores(
	fecha datetime,
	num_directores integer,
	primary key (fecha,num_directores)
  );
  
  insert into cuentaDirectores values (fecha,num_dirs);
  select * from cuentaDirectores;
END //
DELIMITER ;

CALL contar_directores();