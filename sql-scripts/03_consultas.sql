-- ============================================================ 
-- MÓDULO NEWSQL: CONSULTAS ANALÍTICAS (SELECT, JOIN, AGREGACIÓN) 
-- ============================================================ 
-- Consulta 1: Resumen de ventas totales y volumen por cliente (JOIN + GROUP BY) 
SELECT 
  c.cliente_id, 
  c.nombre AS nombre_cliente, 
  c.pais, 
  COUNT(t.transaccion_id) AS total_transacciones, 
  SUM(t.monto_total) AS ingresos_totales 
FROM clientes c 
JOIN transacciones_bigdata t ON c.cliente_id = t.cliente_id 
GROUP BY c.cliente_id, c.nombre, c.pais 
HAVING SUM(t.monto_total) &gt; 5000 
ORDER BY ingresos_totales DESC; 

-- Consulta 2: Análisis de ventas por categoría de producto 
SELECT 
  p.categoria, 
  COUNT(t.transaccion_id) AS cantidad_ventas, 
  SUM(t.cantidad) AS unidades_vendidas, 
  ROUND(AVG(t.monto_total), 2) AS ticket_promedio 
FROM productos p 
JOIN transacciones_bigdata t ON p.producto_id = t.producto_id 
GROUP BY p.categoria 
ORDER BY unidades_vendidas DESC; 

-- Consulta 3: Ranking de transacciones de alto valor utilizando Funciones de Ventana (Analytics) 
SELECT 
  t.transaccion_id, 
  c.nombre AS cliente, 
  p.nombre_producto, 
  t.monto_total, 
  DENSE_RANK() OVER (ORDER BY t.monto_total DESC) AS ranking_monto 
FROM transacciones_bigdata t 
JOIN clientes c ON t.cliente_id = c.cliente_id 
JOIN productos p ON t.producto_id = p.producto_id;
