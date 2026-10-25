-- ============================================================ 
-- MÓDULO NEWSQL: INSERCIÓN DE DATOS (DML) 
-- ============================================================ 

-- Insertar Clientes 
INSERT INTO clientes VALUES (101, 'Carlos Mendoza', 'cmendoza@email.com', 'Colombia', TO_DATE('2024-01-15', 'YYYY-MM-DD')); 
INSERT INTO clientes VALUES (102, 'Ana María Gómez', 'agomez@email.com', 'México', TO_DATE('2024-02-20', 'YYYY-MM-DD')); 
INSERT INTO clientes VALUES (103, 'John Smith', 'jsmith@email.com', 'Estados Unidos', TO_DATE('2024-03-10', 'YYYY-MM-DD')); 
INSERT INTO clientes VALUES (104, 'Lucía Fernández', 'lfernandez@email.com', 'España', TO_DATE('2024-04-05', 'YYYY-MM-DD')); 

-- Insertar Productos 
INSERT INTO productos VALUES (501, 'Servidor Rack 2U Enterprise', 'Infraestructura', 4500.00, 15); 
INSERT INTO productos VALUES (502, 'Licencia Base de Datos NewSQL', 'Software', 1200.00, 100); 
INSERT INTO productos VALUES (503, 'Disco SSD NVMe 4TB Enterprise', 'Almacenamiento', 350.00, 200); 
INSERT INTO productos VALUES (504, 'Switch Administrable 48 Puertos', 'Redes', 850.00, 40); 

-- Insertar Transacciones 
INSERT INTO transacciones_bigdata VALUES (9001, 101, 501, 2, 9000.00, TIMESTAMP '2024-10-10 10:30:00', 'Tarjeta Crédito'); 
INSERT INTO transacciones_bigdata VALUES (9002, 102, 502, 5, 6000.00, TIMESTAMP '2024-10-11 11:15:00', 'Transferencia'); 
INSERT INTO transacciones_bigdata VALUES (9003, 101, 503, 10, 3500.00, TIMESTAMP '2024-10-12 14:45:00', 'Tarjeta Crédito'); 
INSERT INTO transacciones_bigdata VALUES (9004, 103, 501, 1, 4500.00, TIMESTAMP '2024-10-13 09:20:00', 'PayPal'); 
INSERT INTO transacciones_bigdata VALUES (9005, 104, 504, 4, 3400.00, TIMESTAMP '2024-10-14 16:10:00', 'Transferencia'); 
INSERT INTO transacciones_bigdata VALUES (9006, 102, 503, 20, 7000.00, TIMESTAMP '2024-10-15 18:00:00', 'Tarjeta Crédito'); 

COMMIT;
