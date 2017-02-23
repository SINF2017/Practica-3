/**
* Ejercicio 7
*
* Modifica el procedimiento almacenado contar_directores()
* que creaste en los ejercicios 2 y 3
* para que, si la relación cuentaDirectores tiene 10
* tuplas, elimine la más antigua antes de introducir
* la nueva. De esta forma, la relación guardará
* siempre las 10 últimas entradas
*
* NOTE:
*
* IF: https://dev.mysql.com/doc/refman/5.6/en/if.html
* CASE: https://dev.mysql.com/doc/refman/5.6/en/case.html
* WHILE: https://dev.mysql.com/doc/refman/5.6/en/while.html
* REPEAT: https://dev.mysql.com/doc/refman/5.6/en/repeat.html
* LOOP: https://dev.mysql.com/doc/refman/5.6/en/loop.html
*/

DROP PROCEDURE IF EXISTS contar_directores;
DROP TABLE IF EXISTS cuentaDirectores;

DELIMITER //

CREATE PROCEDURE contar_directores()
BEGIN
  DECLARE num_directores INT DEFAULT 0;

  CREATE TABLE IF NOT EXISTS cuentaDirectores(
    num_Directores_Alm  INT NOT NULL,
    fecha DATETIME NOT NULL
  );

  IF ((SELECT count(*) FROM cuentaDirectores) = 10) THEN
      DELETE FROM cuentaDirectores ORDER BY num_Directores_Alm ASC limit 1;
  END IF;

  SET num_directores = (
    SELECT count(*)
    FROM directores
  );

  INSERT INTO cuentaDirectores()
  VALUES(num_directores,now());

  SET @llamadasContarDirectores = (
    SELECT count(*)
    FROM cuentaDirectores
  );
END

//
DELIMITER ;
