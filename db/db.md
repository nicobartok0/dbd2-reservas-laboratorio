**BASE DE DATOS MONGO**

Debe contener las siguientes colecciones:

1. Usuario
	- nombe_usuario:str
	- correo:str
	- contraseña (HASH):str
	- organizaciones:list[ str ]
	- admin:bool

2. Organización
	- nombre:str
	- dominio:str
	- usuarios:list[ ObjectId ]
	
3. Recursos
	- nombre:str
	- descripcion:str
	- organizacion:ObjectId

4. Reservas
	- num_reserva:int
	- emisor:ObjectId
	- estado:str
	- recursos:list[ ObjectId ]
	- fecha:str
	- hora_inicio:str
	- hora_fin:str

**/////////////////////////////////////**

Cada usuario puede pertenecer a varias organizaciones
Cada organización puede tener a varios usuarios
Cada recurso tiene una organización a la cual pertenece y mostrará al usuario al hacer una reserva
Cada reserva es hecha por un solo usuario
Cada reserva puede tener varios recursos asignados


