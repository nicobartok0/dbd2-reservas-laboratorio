Lo que se me ocurre es lo siguiente:
- Añadimos colección "Clases"
- "Usuarios" tiene un campo "admin". Reemplazar por un campo "tipo" (puede ser alumno, admin o profesor)
- Añadimos la colección "Cursos"
- Añadimos la colección "Tareas"
- Cambiamos "reservas" para que se relacione con la clase en vez de 
- Añadimos una colección "Mensajes"
- Añadimos una colección "Calificaciones"

La idea sería:
+ El alumno puede entrar y elegir la organización de la cual quiere ver sus clases
+ Una vez entra tiene un panel principal que le muestra todos los cursos que tiene en esa organización
+ Al elegir un curso le salen las clases que tiene pendientes. El día que tiene cada clase y si tiene una tarea para entregar correspondiente a esa clase.
+ ... vemos de poner otras funconalidades (mensajes quizá?) dependiendo de lo que diga el profe

+ ahora hay pantallas específicas para profesor
+ El profesor tiene una pestaña de panel de control en la que administra los cursos que tiene asignados, puede crear clases para estos cursos y puede crear reservas para una clase.
+ hay que crear las pestañas de crear clase

+ el administrador ahora podrá crear cursos y asignarle un profesor a cada curso además de aceptar o negar las reservas.
+ el alumno puede enviar mensajes a profesores y alumnos
