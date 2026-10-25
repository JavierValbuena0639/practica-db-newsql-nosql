// ============================================================ 
// MÓDULO NOSQL: PIPELINES DE AGREGACIÓN ($match, $group, $sort) 
// ============================================================ 
// Agregación 1: Total de compras y monto invertido agrupado por país 
db.transacciones.aggregate([ 
  { $unwind: "$compras" }, 
  { 
    $group: { 
      _id: "$pais", 
      total_inversion: { $sum: "$compras.monto" }, 
      cantidad_compras: { $sum: 1 } 
    } 
  }, 
  { $sort: { total_inversion: -1 } } 
]); 
// Agregación 2: Análisis de dispositivos utilizados por clientes activos 
db.transacciones.aggregate([ 
  { $match: { "activo": true } }, 
  { $group: { 
    _id: "$dispositivo", 
    total_clientes: { $sum: 1 } 
   } 
  } 
]);
