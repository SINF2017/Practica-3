/**
* Ejercicio 4:
* Crea un procedimiento almacenado consultaPorNacionalidad()
* que tome como parámetro de
* entrada una nacionalidad y muestre todas las
* películas, directores y actores con dicha nacionalidad.
*/

DROP PROCEDURE IF EXISTS consultaPorNacionalidad;

DELIMITER //

CREATE PROCEDURE consultaPorNacionalidad(IN nacionalidad VARCHAR(50))
BEGIN

SELECT titulo as "Pelicula"
FROM peliculas
WHERE peliculas.nacionalidad = nacionalidad;


SELECT nombre as "Director"
FROM directores
WHERE directores.nacionalidad = nacionalidad;

SELECT nombre as "Actor"
FROM actores
WHERE actores.nacionalidad = nacionalidad;

END
//

DELIMITER ;
