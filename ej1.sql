
/**
  * We are going to use DELIMITER for
  * tell to mySQL client that we have
  * finished typing in an SQL statement.
  * http://stackoverflow.com/questions/11754781/how-to-declare-a-variable-in-mysql
  */

DROP PROCEDURE IF EXISTS listar_directores_peliculas;

DELIMITER //

CREATE PROCEDURE listar_directores_peliculas()
BEGIN
  SELECT directores.nombre AS "Director:", peliculas.titulo AS "Titulo de pelicula:"
  FROM directores,peliculas
  WHERE peliculas.ID_director = directores.ID_director
  ORDER BY peliculas.titulo ASC;
END//

DELIMITER ;
