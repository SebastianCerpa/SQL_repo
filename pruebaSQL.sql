--7. Por cada pregunta, en la tabla preguntas, cuenta cuántos usuarios respondieron correctamente

SELECT preguntas.id, preguntas.pregunta,
COUNT (respuestas.id) as cantidad_usuarios
FROM preguntas LEFT JOIN respuestas
ON preguntas.id = respuestas.pregunta_id
AND preguntas.respuesta_correcta = respuestas.respuesta
GROUP BY preguntas.id, preguntas.pregunta
ORDER BY preguntas.id;

--8. Implementa un borrado en cascada de las respuestas al borrar un usuario. Prueba la implementación borrando el primer usuario.

ALTER TABLE respuestas
DROP CONSTRAINT respuestas_usuario_id_fkey,
ADD FOREIGN KEY (usuario_id)
REFERENCES usuarios(id)
ON DELETE CASCADE;

DELETE FROM usuarios WHERE id = 1;

SELECT * FROM usuarios;
SELECT * FROM respuestas;

--9. Crea una restricción que impida insertar usuarios menores de 18 años en la base de datos.

ALTER TABLE usuarios
ADD CONSTRAINT edad
CHECK (edad >= 18);

INSERT INTO usuarios (id, nombre, edad) VALUES (6, 'carolina', 17);
INSERT INTO usuarios (id, nombre, edad) VALUES (6, 'carolina', 18);

--10. Altera la tabla existente de usuarios agregando el campo email. Debe tener la restricción de ser único.

ALTER TABLE usuarios ADD COLUMN email VARCHAR;

ALTER TABLE usuarios
ADD CONSTRAINT email_unique UNIQUE (email);

SELECT * FROM usuarios;

UPDATE usuarios SET email = 'tomas@gmail.com' WHERE id = 2;
UPDATE usuarios SET email = 'tomas@gmail.com' WHERE id = 3;

