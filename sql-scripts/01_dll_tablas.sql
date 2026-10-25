-- ============================================================ 
-- MÓDULO NEWSQL: DEFINICIÓN DE ESTRUCTURA (DDL) 
-- Escenario: Sistema de Transacciones E-Commerce Big Data 
-- ============================================================ 
-- Limpieza previa de tablas (si existen) 
DROP TABLE transacciones_bigdata CASCADE CONSTRAINTS; 
DROP TABLE productos CASCADE CONSTRAINTS; 
DROP TABLE clientes CASCADE CONSTRAINTS; 
-- 1. Tabla Clientes 
CREATE TABLE clientes ( 
  cliente_id NUMBER(10) PRIMARY KEY, 
  nombre VARCHAR2(100) NOT NULL, 
  email VARCHAR2(100) UNIQUE NOT NULL, 
  pais VARCHAR2(50) NOT NULL, 
  fecha_registro DATE DEFAULT SYSDATE 
  ); 
-- 2. Tabla Productos 
CREATE TABLE productos ( 
  producto_id NUMBER(10) PRIMARY KEY, 
  nombre_producto VARCHAR2(150) NOT NULL, 
  categoria VARCHAR2(50) NOT NULL, 
  precio_unitario NUMBER(12, 2) NOT NULL, 
  stock NUMBER(8) NOT NULL 
  ); 
-- 3. Tabla Transacciones (Tabla principal de volumen Big Data) 
CREATE TABLE transacciones_bigdata ( 
  transaccion_id NUMBER(15) PRIMARY KEY, 
  cliente_id NUMBER(10) NOT NULL, 
  producto_id NUMBER(10) NOT NULL, 
  cantidad NUMBER(5) NOT NULL, 
  monto_total NUMBER(14, 2) NOT NULL, 
  fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  metodo_pago VARCHAR2(30) NOT NULL, 
  CONSTRAINT fk_trans_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id), 
  CONSTRAINT fk_trans_producto FOREIGN KEY (producto_id) REFERENCES productos(producto_id) ); 
-- 4. Creación de Índices para Optimización NewSQL (Consultas Frecuentes) 
CREATE INDEX idx_trans_fecha ON transacciones_bigdata(fecha_hora); 
CREATE INDEX idx_trans_cliente ON transacciones_bigdata(cliente_id); 
CREATE INDEX idx_prod_cat ON productos(categoria);
