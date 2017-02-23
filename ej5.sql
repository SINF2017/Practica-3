/**
* Ejercicio 5;
* Crea un procedimiento almacenado peliculasPorNacionalidad()
* que tome como parámetro de
* entrada una nacionalidad y devuelva en un
* segundo parámetro entero el número de películas
* que tienen dicha nacionalidad.
*/

DROP PROCEDURE IF EXISTS peliculasPorNacionalidad;

DELIMITER //

CREATE PROCEDURE peliculasPorNacionalidad(IN nacionalidad VARCHAR(50), OUT numPelNacionalidad INT)
BEGIN
SELECT count(*) INTO numPelNacionalidad
FROM peliculas
WHERE peliculas.nacionalidad = nacionalidad;
END

//
DELIMITER ;

CALL peliculasPorNacionalidad("Estados Unidos",@numeroPeliculasEEUU);
SELECT @numeroPeliculasEEUU;
