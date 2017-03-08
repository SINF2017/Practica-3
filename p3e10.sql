/* source C:\Users\Sara\Desktop\p3e10.sql 
show procedure status; 
describe peliculas*/
use practica2;
DROP PROCEDURE if exists introducir_pelicula;

DELIMITER //
CREATE PROCEDURE introducir_pelicula(IN id int, IN tit char(20), IN director int, IN i int, IN nacion varchar(20))
begin
	START TRANSACTION;
	insert into peliculas values (id,tit,director,i,nacion);
	commit;
	select * from peliculas;
end //

DELIMITER ;

CALL introducir_pelicula(8,'La Sirenita',3,2809,'Inglesa');
CALL introducir_pelicula(9,'101 Dalmatas',0,28098,'Alemana');