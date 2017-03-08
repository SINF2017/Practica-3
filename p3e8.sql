/*https://totaki.com/poesiabinaria/2013/12/bucles-y-cursores-en-mysql-con-ejemplos/ */
/* source C:\Users\Sara\Desktop\p3e8.sql */
use practica2;
DROP PROCEDURE if exists extraer_imdbs;

DELIMITER //
CREATE PROCEDURE extraer_imdbs(IN nacion VARCHAR(20))
BEGIN
declare nac VARCHAR(20);
declare im int;
DECLARE fin INTEGER DEFAULT 0; /*Variable para controlar el fin del bucle*/
declare cursor_actores cursor for select imbd,nacionalidad from actores;
declare cursor_directores cursor for select imbd,nacionalidad from directores;
declare cursor_peliculas cursor for select imbd,nacionalidad from peliculas;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1; /*condicion de salida*/

set @sqlCommand := CONCAT('drop table if exists ',nacion,'');
PREPARE crearrelacion FROM @sqlCommand;
EXECUTE crearrelacion;

set @sqlCommand := CONCAT('CREATE TABLE IF NOT EXISTS ',nacion,' (IMDb int primary key)');
PREPARE crearrelacion FROM @sqlCommand;
EXECUTE crearrelacion;

OPEN cursor_actores;
get_actores: LOOP
	FETCH cursor_actores INTO im,nac;
	
	if nac = nacion then
		set @sqlCommand := CONCAT('insert into ',nacion,' VALUES(',im,')');
		PREPARE crearrelacion FROM @sqlCommand;
		EXECUTE crearrelacion;
	end if;
	
	if fin = 1 then
		LEAVE get_actores;
	end if;
end loop get_actores;
close cursor_actores;

set fin := 0;

OPEN cursor_directores;
get_directores: LOOP
	FETCH cursor_directores INTO im,nac;
	
	if nac = nacion then
		set @sqlCommand := CONCAT('insert into ',nacion,' VALUES(',im,')');
		PREPARE crearrelacion FROM @sqlCommand;
		EXECUTE crearrelacion;
	end if;
	
	if fin = 1 then
		LEAVE get_directores;
	end if;
end loop get_directores;
close cursor_directores;

set fin := 0;

OPEN cursor_peliculas;
get_peliculas: LOOP
	FETCH cursor_peliculas INTO im,nac;
	
	if nac = nacion then
		set @sqlCommand := CONCAT('insert into ',nacion,' VALUES(',im,')');
		PREPARE crearrelacion FROM @sqlCommand;
		EXECUTE crearrelacion;
	end if;
	
	if fin = 1 then
		LEAVE get_peliculas;
	end if;
end loop get_peliculas;
close cursor_peliculas;

END //

DELIMITER ;

CALL extraer_imdbs('Espanhola');