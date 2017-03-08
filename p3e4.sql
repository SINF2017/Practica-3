use practica2;
DROP PROCEDURE if exists consultaPorNacionalidad;

ALTER TABLE directores ADD nacionalidad VARCHAR(20);
UPDATE directores SET nacionalidad = 'Inglesa' WHERE ID_director=0;
UPDATE directores SET nacionalidad = 'Alemana' WHERE ID_director=1;
UPDATE directores SET nacionalidad = 'Espanhola' WHERE ID_director=2;
UPDATE directores SET nacionalidad = 'Italiana' WHERE ID_director=3;
UPDATE directores SET nacionalidad = 'Belga' WHERE ID_director=4;
UPDATE directores SET nacionalidad = 'Francesa' WHERE ID_director=5;

ALTER TABLE actores ADD nacionalidad VARCHAR(20);
UPDATE actores SET nacionalidad = 'Inglesa' WHERE ID_actor=0;
UPDATE actores SET nacionalidad = 'Alemana' WHERE ID_actor=1;
UPDATE actores SET nacionalidad = 'Espanhola' WHERE ID_actor=2;
UPDATE actores SET nacionalidad = 'Italiana' WHERE ID_actor=3;
UPDATE actores SET nacionalidad = 'Belga' WHERE ID_actor=4;
UPDATE actores SET nacionalidad = 'Francesa' WHERE ID_actor=5;

ALTER TABLE peliculas ADD nacionalidad VARCHAR(20);
UPDATE peliculas SET nacionalidad = 'Inglesa' WHERE ID_pelicula=0;
UPDATE peliculas SET nacionalidad = 'Alemana' WHERE ID_pelicula=1;
UPDATE peliculas SET nacionalidad = 'Espanhola' WHERE ID_pelicula=2;
UPDATE peliculas SET nacionalidad = 'Italiana' WHERE ID_pelicula=3;
UPDATE peliculas SET nacionalidad = 'Belga' WHERE ID_pelicula=4;
UPDATE peliculas SET nacionalidad = 'Francesa' WHERE ID_pelicula=5;
UPDATE peliculas SET nacionalidad = 'Espanhola' WHERE ID_pelicula=6;

DELIMITER //
CREATE PROCEDURE consultaPorNacionalidad(IN nacion VARCHAR(20))
BEGIN

(select nombre,imbd from actores where nacionalidad=nacion)
union
(select nombre,imbd from directores where nacionalidad=nacion)
union
(select titulo as nombre,imbd from peliculas where nacionalidad=nacion);

END //
DELIMITER ;

CALL consultaPorNacionalidad('Inglesa');
CALL consultaPorNacionalidad('Francesa');