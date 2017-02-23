/**
* Ejercicio 6:
*
* Crea un procedimiento almacenado ponerEnMayusculas()
* que tome como parámetro una
* cadena de caracteres y la convierta a letras mayúsculas1.
*/

DROP PROCEDURE IF EXISTS ponerEnMayusculas;

DELIMITER //

CREATE PROCEDURE ponerEnMayusculas(IN cadena VARCHAR(50),OUT cadenaMayuscula VARCHAR(50))
BEGIN
SELECT upper(cadena) INTO cadenaMayuscula;
END

//

DELIMITER ;

CALL ponerEnMayusculas('el telebicho',@cadenaMayuscula);
SELECT @cadenaMayuscula;
