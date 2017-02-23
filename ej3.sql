/**
* Para ver los procedimientos disponibles (procedure):
* > SHOW PROCEDURE STATUS;
*
* Para llamar a un procedimiento:
* > CALL name_procedure;
*
* Para obtener el valor de una variable de sesión:
* > SELECT @nombre_variable_sesion;
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
