// ============================================================ 
// MÓDULO NOSQL: OPERACIONES CRUD EN MONGODB COMPASS 
// ============================================================ 
// 1. Inserción de un nuevo documento 
db.transacciones.insertOne({ 
  "cliente": "Lucía Fernández", 
  "pais": "España", 
  "categoria_interes": "Redes", 
  "dispositivo": "Tablet", 
  "compras": [ 
    { "producto": "Switch Administrable", "monto": 850, "fecha": "2024-10-14" } 
  ], 
  "activo": true, 
  "nivel_prioridad": "ALTA" 
}); 
// 2. Consulta con filtros múltiples (clientes activos de prioridad ALTA) 
db.transacciones.find({ 
  "activo": true, 
  "nivel_prioridad": "ALTA" 
}); 
// 3. Actualización de campo anidado / estado ($set) 
db.transacciones.updateOne( 
  { "cliente": "John Smith" }, 
  { $set: { "activo": true, "nivel_prioridad": "MEDIA" } } 
); 
// 4. Consulta por elementos dentro de arreglos ($elemMatch) 
db.transacciones.find({ 
  "compras": 
  { $elemMatch: { "monto": { $gte: 4000 } } 
  } 
});
