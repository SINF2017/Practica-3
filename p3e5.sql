use practica2;
DROP PROCEDURE if exists peliculasPorNacionalidad;

DELIMITER //
CREATE PROCEDURE peliculasPorNacionalidad(IN nacion VARCHAR(20), OUT num int)
BEGIN
set num = (select count(*) from peliculas where nacionalidad = nacion);
END //
DELIMITER ;

CALL peliculasPorNacionalidad('Inglesa',@numero);
select @numero;

CALL peliculasPorNacionalidad('Espanhola',@numero);
select @numero;