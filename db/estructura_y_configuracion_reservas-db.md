# 🗃️ Estructura y Configuración de la Base de Datos `reservas-db`

## 📘 Colecciones Principales

La base de datos `reservas-db` modela un **portal educativo** con reservas de aulas y recursos, tareas, mensajes y entregas.  
Sus colecciones están **relacionadas mediante referencias (`ObjectId`)** para conectar usuarios, cursos, organizaciones y recursos.

Colecciones principales:
- `usuarios`
- `organizaciones`
- `cursos`
- `recursos`
- `reservas`
- `tareas`
- `entregas`
- `clases`
- `temas`
- `mensajes`

---

## ⚙️ Índices Agregados

Los índices fueron diseñados para mejorar el rendimiento en consultas frecuentes y asegurar unicidad de datos críticos.

| Colección | Índice | Tipo | Descripción |
|------------|--------|------|--------------|
| **usuarios** | `{ correo: 1 }` | Único | Evita correos duplicados entre usuarios. |
| **usuarios** | `{ nombre_usuario: 1 }` | Único | Evita nombres de usuario repetidos. |
| **organizaciones** | `{ nombre: 1 }` | Único | Garantiza que no existan dos organizaciones con el mismo nombre. |
| **cursos** | `{ nombre: 1, organización: 1 }` | Compuesto | Acelera búsquedas de cursos dentro de una organización. |
| **recursos** | `{ nombre: 1, organización: 1 }` | Compuesto | Facilita la búsqueda de recursos en una organización específica. |
| **reservas** | `{ fecha: 1, hora_inicio: 1, recurso: 1 }` | Compuesto | Mejora la búsqueda de reservas por día, hora y recurso. |
| **tareas** | `{ fecha_vencimiento: 1 }` | No único | Acelera búsquedas por fecha límite. |
| **entregas** | `{ tarea: 1, alumno: 1 }` | Compuesto y único | Evita entregas duplicadas de un mismo alumno para una tarea. |
| **mensajes** | `{ emisor: 1, fecha_envío: 1 }` | No único | Mejora el orden cronológico en la vista de mensajes. |

---

## ✅ Validaciones de Esquema

Se establecieron **validaciones JSON Schema** para asegurar integridad estructural y consistencia de datos.

### 🧍 `usuarios`
```json
{
  "bsonType": "object",
  "required": ["nombre_usuario", "correo", "password", "organizaciones"],
  "properties": {
    "nombre_usuario": { "bsonType": "string" },
    "correo": { "bsonType": "string", "pattern": "^.+@.+\..+$" },
    "password": { "bsonType": "string" },
    "admin": { "bsonType": "bool" },
    "organizaciones": { "bsonType": "array" }
  }
}
```

### 🏢 `organizaciones`
```json
{
  "bsonType": "object",
  "required": ["nombre", "dominio"],
  "properties": {
    "nombre": { "bsonType": "string" },
    "dominio": { "bsonType": "string" },
    "usuarios": { "bsonType": "array" }
  }
}
```

### 📚 `cursos`
```json
{
  "bsonType": "object",
  "required": ["nombre", "organización"],
  "properties": {
    "nombre": { "bsonType": "string" },
    "organización": { "bsonType": "objectId" }
  }
}
```

### 🏫 `reservas`
```json
{
  "bsonType": "object",
  "required": ["emisor", "recursos", "fecha", "hora_inicio", "hora_fin"],
  "properties": {
    "emisor": { "bsonType": "objectId" },
    "recursos": { "bsonType": "array" },
    "fecha": { "bsonType": "date" },
    "hora_inicio": { "bsonType": "string" },
    "hora_fin": { "bsonType": "string" },
    "estado": { "enum": ["pendiente", "confirmada", "cancelada"] }
  }
}
```

### 📦 `recursos`
```json
{
  "bsonType": "object",
  "required": ["nombre", "organización"],
  "properties": {
    "nombre": { "bsonType": "string" },
    "organización": { "bsonType": "objectId" },
    "descripción": { "bsonType": "string" }
  }
}
```

### 📄 `tareas`
```json
{
  "bsonType": "object",
  "required": ["nombre", "fecha_creación", "fecha_vencimiento"],
  "properties": {
    "nombre": { "bsonType": "string" },
    "fecha_creación": { "bsonType": "date" },
    "fecha_vencimiento": { "bsonType": "date" }
  }
}
```

---

## 💾 Exportar Toda la Base de Datos

Para exportar la base completa (todas las colecciones y datos):

### 🧱 Desde la terminal con `mongodump`
```bash
mongodump --db=reservas-db --out=/ruta/de/exportacion
```

Esto creará un directorio como:
```
/ruta/de/exportacion/reservas-db/
```
con un `.bson` y `.metadata.json` por cada colección.

### 🧩 Para importar nuevamente
```bash
mongorestore --db=reservas-db /ruta/de/exportacion/reservas-db
```
