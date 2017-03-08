/* https://dev.mysql.com/doc/refman/5.7/en/commit.html */
use practica2;

START TRANSACTION;
select * from peliculas where ID_pelicula = 4;
update peliculas set nacionalidad = 'Francesa' where ID_pelicula=4;
/*Si apagamos en este punto la BD y arrancamos de nuevo se ve que NO se ha producido ningun cambio en la pelicula con ID 4.*/
commit;
/*Si apagamos en este punto la BD y arrancamos de nuevo se ve que SI se ha producido un cambio en la pelicula con ID 4.*/
select * from peliculas where ID_pelicula = 4;