/**
* Ejercicio 10:
*
* Crea un procedimiento almacenado denominado
* introducir_pelicula() que tome como parámetros
* todos los datos necesarios para introducir
* en nuestra base de datos de películas una nueva
* película junto con su director.
* El procedimiento debe realizar la totalidad de la
* operación o bien dejar la base de datos inalterada.
*/

DROP PROCEDURE IF EXISTS introducir_pelicula;

DELIMITER //

CREATE PROCEDURE introducir_pelicula(
  IN ID_pelicula INT, IN IMDB_pelicula INT,
  IN titulo_pelicula VARCHAR(50), IN nacionalidad_pelicula VARCHAR(50),
  IN ID_director INT, IN IMDB_director INT,
  IN nombre_director VARCHAR(100),IN edad_director INT,
  IN nacionalidad_director VARCHAR(50))
BEGIN

START TRANSACTION;

INSERT INTO directores(ID_director,IMDB,nombre,edad,nacionalidad)
VALUES (ID_director,IMDB_director,nombre_director,edad_director,nacionalidad_director);

INSERT INTO peliculas (ID_pelicula,IMDB,ID_director,titulo, nacionalidad)
VALUES (ID_pelicula,IMDB_pelicula,ID_director,titulo_pelicula,nacionalidad_pelicula);

COMMIT;
END
//

DELIMITER ;


CALL introducir_pelicula(11,2015381,'Guardianes de la galaxia','Estados Unidos',
  9,0348181,'James Gunn',46,'Estados Unidos');

SELECT * FROM peliculas;
SELECT * FROM directores;
