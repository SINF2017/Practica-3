/*
* Ejercicio 8:
*
* Crea un procedimiento almacenado extraer_imdbs()
* que tome como parámetro una
* nacionalidad y cree una nueva relación con el
* nombre de dicha nacionalidad y que almacene
* los códigos Imdb de todas las películas, actores
* y directores que tengan esa nacionalidad2.
*
* NOTE:
* 1. DECLARE CURSOR: para declarar un nuevo cursor.
* 2. OPEN: para abrir el cursor y empezar a utilizarlo.
* 3. FETCH: para obtener la siguiente tupla del resultado
* de la consulta. Asociada a esta sentencia tenemos la clausula
* INTO que nos permite almacenar en variables los valores de los
* atributos de la tupla actual.
* 4. CLOSE: para cerrar el cursor cuando no se va a utilizar más.
*
* NOTE:
* Preguntar porque no ordena por ID si se lo estoy indicando claramente
*/

DROP PROCEDURE IF EXISTS extraer_imdbs;

DELIMITER //
CREATE PROCEDURE extraer_imdbs(IN nacionalidad VARCHAR(50))
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE IMDB_pelicula,IMDB_director,IMDB_actor INT;
DECLARE cursorPeliculas CURSOR FOR (
  SELECT IMDB
  FROM peliculas
  WHERE peliculas.nacionalidad = nacionalidad
  ORDER BY peliculas.ID_pelicula ASC);
DECLARE cursorDirectores CURSOR FOR (
  SELECT IMDB
  FROM directores
  WHERE directores.nacionalidad = nacionalidad
  ORDER BY directores.ID_director ASC);
DECLARE cursorActores CURSOR FOR (
  SELECT IMDB
  FROM actores
  WHERE actores.nacionalidad = nacionalidad
  ORDER BY actores.ID_actor ASC);
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;


OPEN cursorPeliculas;
OPEN cursorDirectores;
OPEN cursorActores;

SET @dropTab = CONCAT('DROP TABLE IF EXISTS `', nacionalidad,'`');
prepare stmt1 from @dropTab;
execute stmt1;
deallocate prepare stmt1;

SET @createTab = CONCAT('CREATE TABLE `', nacionalidad,'`(
  IMDB INTEGER NOT NULL,
  PRIMARY KEY (IMDB))');
prepare stmt1 from @createTab;
execute stmt1;
deallocate prepare stmt1;

/** Bucle para añadir IMDB peliculas */
peliculas_loop: LOOP
  FETCH cursorPeliculas INTO IMDB_pelicula;
  IF done THEN
      LEAVE peliculas_loop;
  END IF;
  SET @insertTable = CONCAT('INSERT INTO `',nacionalidad,'` () VALUE(',IMDB_pelicula,')');
  prepare stmt from @insertTable;
  execute stmt;
  deallocate prepare stmt;
END LOOP;
CLOSE cursorPeliculas;
SET done = FALSE;

/** Bucle para añadir IMDB actores */
actores_loop: LOOP
  FETCH cursorActores INTO IMDB_actor;
  IF done THEN
    LEAVE actores_loop;
  END IF;
  SET @insertTable = CONCAT('INSERT INTO `',nacionalidad,'` () VALUE(',IMDB_actor,')');
  prepare stmt from @insertTable;
  execute stmt;
  deallocate prepare stmt;
END LOOP;
CLOSE cursorActores;
SET done = FALSE;

/** Bucle para añadir IMDB directores */
directores_loop: LOOP
  FETCH cursorDirectores INTO IMDB_director;
  IF done THEN
    LEAVE directores_loop;
  END IF;
  SET @insertTable = CONCAT('INSERT INTO `',nacionalidad,'` () VALUE(',IMDB_director,')');
  prepare stmt from @insertTable;
  execute stmt;
  deallocate prepare stmt;
END LOOP;
CLOSE cursorDirectores;

END
//
DELIMITER ;
