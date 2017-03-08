use practica2;
DROP PROCEDURE if exists ponerEnMayusculas;

DELIMITER //
CREATE PROCEDURE ponerEnMayusculas(INOUT frase VARCHAR(20))
BEGIN
	SELECT UPPER(frase) INTO frase;
END //
DELIMITER ;

set @frase = "hola";
CALL ponerEnMayusculas(@frase);
select @frase;