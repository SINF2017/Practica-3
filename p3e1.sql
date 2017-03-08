use practica2;
show procedure status;
DROP PROCEDURE if exists listar_directores_peliculas;

DELIMITER //
CREATE PROCEDURE listar_directores_peliculas()
BEGIN
  SELECT titulo, directores.nombre as nombre_director FROM peliculas
  left join directores on directores.ID_director= peliculas.ID_director;
END //
DELIMITER ;

CALL listar_directores_peliculas();