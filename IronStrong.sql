
CREATE TABLE Miembros (
    IdMiembro INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Email NVARCHAR(120) NOT NULL UNIQUE,
    Estado NVARCHAR(10) NOT NULL CONSTRAINT CK_Miembros_Estado CHECK (Estado IN ('Activo','Inactivo'))
);
GO


CREATE TABLE Membresias (
    IdMembresia INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,        -- Mensual, Anual, VIP, etc.
    Costo DECIMAL(10,2) NOT NULL,
    DuracionDias INT NOT NULL
);
GO


CREATE TABLE Entrenadores (
    IdEntrenador INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Especialidad NVARCHAR(100) NULL
);
GO


CREATE TABLE Contratos (
    IdContrato INT IDENTITY(1,1) PRIMARY KEY,
    IdMiembro INT NOT NULL,
    IdMembresia INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL,
    CONSTRAINT FK_Contratos_Miembros FOREIGN KEY (IdMiembro) REFERENCES dbo.Miembros(IdMiembro),
    CONSTRAINT FK_Contratos_Membresias FOREIGN KEY (IdMembresia) REFERENCES dbo.Membresias(IdMembresia)
);
GO

CREATE TABLE Clases (
    IdClase INT IDENTITY(1,1) PRIMARY KEY,
    NombreClase NVARCHAR(100) NOT NULL,
    IdEntrenador INT NOT NULL,
    Horario DATETIME2 NOT NULL,
    CupoMaximo INT NOT NULL,
    CONSTRAINT FK_Clases_Entrenadores FOREIGN KEY (IdEntrenador) REFERENCES dbo.Entrenadores(IdEntrenador)
);
GO

CREATE TABLE Asistencias (
    IdAsistencia INT IDENTITY(1,1) PRIMARY KEY,
    IdClase INT NOT NULL,
    IdMiembro INT NOT NULL,
    FechaRegistro DATETIME2 NOT NULL DEFAULT (GETDATE()),
    CONSTRAINT FK_Asistencias_Clases FOREIGN KEY (IdClase) REFERENCES dbo.Clases(IdClase),
    CONSTRAINT FK_Asistencias_Miembros FOREIGN KEY (IdMiembro) REFERENCES dbo.Miembros(IdMiembro)
);
GO

CREATE TABLE Pagos (
    IdPago INT IDENTITY(1,1) PRIMARY KEY,
    IdContrato INT NOT NULL,
    Monto DECIMAL(10,2) NOT NULL,
    FechaPago DATE NOT NULL,
    CONSTRAINT FK_Pagos_Contratos FOREIGN KEY (IdContrato) REFERENCES dbo.Contratos(IdContrato)
);
GO




INSERT INTO Membresias (Nombre, Costo, DuracionDias) VALUES
('Mensual', 25000.00, 30),
('Trimestral', 70000.00, 90),
('Semestral', 130000.00, 180),
('Anual', 240000.00, 365),
('VIP', 350000.00, 365);
GO

INSERT INTO Entrenadores (Nombre, Especialidad) VALUES
('Luis Ramírez', 'Crossfit'),
('María Jiménez', 'Yoga'),
('Pedro Solano', 'Musculación'),
('Alicia Vargas', 'Pilates'),
('Diego Mora', 'Spinning'),
('Carla Sánchez', 'HIIT'),
('Andrés Quesada', 'Boxeo'),
('Sofía Porras', 'Funcional'),
('Roberto Vega', 'Natación'),
('Natalia Ruiz', 'Zumba');
GO

INSERT INTO Entrenadores (Nombre, Especialidad)
VALUES ('Jairo Ezquivel', 'Nada');


INSERT INTO Miembros (Nombre, FechaNacimiento, Email, Estado) VALUES
('Carlos Méndez', '1990-05-12', 'carlos.mendez@example.com', 'Activo'),
('Ana López', '1988-09-21', 'ana.lopez@example.com', 'Activo'),
('Julián Pacheco', '1997-03-14', 'julian.pacheco@example.com', 'Activo'),
('María Fernández', '1992-11-02', 'maria.fernandez@example.com', 'Activo'),
('Pedro González', '1985-01-30', 'pedro.gonzalez@example.com', 'Activo'),
('Lucía Ramírez', '1999-07-07', 'lucia.ramirez@example.com', 'Activo'),
('Miguel Torres', '1994-12-20', 'miguel.torres@example.com', 'Activo'),
('Isabel Cruz', '2000-06-08', 'isabel.cruz@example.com', 'Activo'),
('Fernando Castro', '1987-04-25', 'fernando.castro@example.com', 'Activo'),
('Paula Núñez', '1996-02-02', 'paula.nunez@example.com', 'Activo'),
('Diego Flores', '1991-10-10', 'diego.flores@example.com', 'Activo'),
('Sonia Herrera', '1993-08-18', 'sonia.herrera@example.com', 'Activo'),
('Andrés López', '1989-09-09', 'andres.lopez@example.com', 'Activo'),
('Valeria Jiménez', '1998-05-05', 'valeria.jimenez@example.com', 'Activo'),
('Ricardo Solís', '1986-03-03', 'ricardo.solis@example.com', 'Activo'),
('Karla Méndez', '1995-01-15', 'karla.mendez@example.com', 'Activo'),
('Oscar Rojas', '1992-07-23', 'oscar.rojas@example.com', 'Activo'),
('Paola Vega', '1990-02-28', 'paola.vega@example.com', 'Activo'),
('Mauricio Paredes', '1984-12-12', 'mauricio.paredes@example.com', 'Activo'),
('Fernanda Soto', '1997-09-04', 'fernanda.soto@example.com', 'Activo');
GO


INSERT INTO Clases (NombreClase, IdEntrenador, Horario, CupoMaximo) VALUES
('Yoga Matutino', 2, '2025-01-10 08:00:00', 20),
('Crossfit Inicial', 1, '2025-01-10 10:00:00', 15),
('Pilates Intermedio', 4, '2025-01-11 09:00:00', 18),
('Spinning Tarde', 5, '2025-01-11 18:00:00', 20),
('HIIT Express', 6, '2025-01-12 07:00:00', 12),
('Boxeo Avanzado', 7, '2025-01-12 19:00:00', 15),
('Funcional Grupo', 8, '2025-01-13 17:00:00', 20),
('Natación Adultos', 9, '2025-01-13 16:00:00', 10),
('Zumba Weekend', 10, '2025-01-14 10:00:00', 25),
('Musculación Básico', 3, '2025-01-14 08:00:00', 15),
('Yoga Noche', 2, '2025-01-15 19:30:00', 20),
('Crossfit Avanzado', 1, '2025-01-15 06:30:00', 12),
('Pilates Tonificación', 4, '2025-01-16 11:00:00', 18),
('HIIT Tarde', 6, '2025-01-16 18:30:00', 12),
('Zumba Express', 10, '2025-01-17 12:00:00', 20);
GO


INSERT INTO Asistencias (IdClase, IdMiembro, FechaRegistro) VALUES
(1,1,GETDATE()), (1,2,GETDATE()), (1,3,GETDATE()),
(2,4,GETDATE()), (2,5,GETDATE()), (2,6,GETDATE()),
(3,7,GETDATE()), (3,8,GETDATE()), (3,9,GETDATE()),
(4,10,GETDATE()), (4,11,GETDATE()), (4,12,GETDATE()),
(5,13,GETDATE()), (5,14,GETDATE()), (5,15,GETDATE()),
(6,16,GETDATE()), (6,17,GETDATE()), (6,18,GETDATE()),
(7,19,GETDATE()), (7,20,GETDATE()), (8,1,GETDATE()),
(8,2,GETDATE()), (9,3,GETDATE()), (9,4,GETDATE()),
(10,5,GETDATE()), (10,6,GETDATE()), (11,7,GETDATE()),
(12,8,GETDATE()), (13,9,GETDATE()), (14,10,GETDATE());
GO


INSERT INTO Contratos (IdMiembro, IdMembresia, FechaInicio, FechaFin) VALUES
(1,1,'2025-01-01','2025-01-31'),
(2,5,'2025-01-01','2025-12-31'),
(3,2,'2025-01-15','2025-04-14');
GO


INSERT INTO Pagos (IdContrato, Monto, FechaPago) VALUES
(1,25000.00,'2025-01-01'),
(2,350000.00,'2025-01-02'),
(3,70000.00,'2025-01-15');
GO

--Miembros que tienen una membresía "VIP"

SELECT 
    M.IdMiembro,
    M.Nombre,
    Mb.Nombre AS TipoMembresia
FROM Miembros M
INNER JOIN Contratos C ON M.IdMiembro = C.IdMiembro
INNER JOIN Membresias Mb ON C.IdMembresia = Mb.IdMembresia
WHERE Mb.Nombre = 'VIP';

--Clase, horario y profe

SELECT 
    C.IdClase,
    C.NombreClase,
    C.Horario,
    E.Nombre AS Entrenador
FROM Clases C
INNER JOIN Entrenadores E ON C.IdEntrenador = E.IdEntrenador
ORDER BY C.Horario, E.Nombre;

--miembros que no han ido a clases
SELECT 
    M.IdMiembro,
    M.Nombre,
    M.Email
FROM Miembros M
LEFT JOIN Asistencias A ON M.IdMiembro = A.IdMiembro
WHERE A.IdMiembro IS NULL;

--pagos ultimo mes 
SELECT 
    P.IdPago,
    P.Monto,
    P.FechaPago,
    C.IdMiembro
FROM Pagos P
INNER JOIN Contratos C ON P.IdContrato = C.IdContrato
WHERE P.FechaPago >= DATEADD(MONTH, -1, GETDATE());


--Crear una lista unificada de correos electrónicos de Miembros y Entrenadores para enviar un boletín informativo
SELECT Nombre, Email
FROM Miembros

UNION

SELECT Nombre, NULL AS Email
FROM Entrenadores;

--Identificar miembros que tienen un contrato activo Y que han asistido a al menos una clase esta semana
SELECT IdMiembro
FROM Contratos
WHERE FechaFin >= GETDATE()

INTERSECT

SELECT IdMiembro
FROM Asistencias
WHERE FechaRegistro >= DATEADD(DAY, -7, GETDATE());



--Listar los Entrenadores que están registrados en el sistema pero que NO tienen ninguna clase asignada actualmente.
SELECT IdEntrenador
FROM Entrenadores

EXCEPT

SELECT IdEntrenador
FROM Clases;

-- transaccion membresia
DECLARE 
    @IdContrato INT = 1,                -- contrato que se renueva
    @MontoPago DECIMAL(10,2) = 25000.00, -- monto ingresado por el usuario
    @CostoMembresia DECIMAL(10,2),
    @DuracionDias INT;

BEGIN TRY
    BEGIN TRANSACTION;

 
    SELECT 
        @CostoMembresia = M.Costo,
        @DuracionDias = M.DuracionDias
    FROM Contratos C
    INNER JOIN Membresias M ON C.IdMembresia = M.IdMembresia
    WHERE C.IdContrato = @IdContrato;

    
    IF (@MontoPago < @CostoMembresia)
    BEGIN
        PRINT 'ERROR: El pago es insuficiente. Se realiza ROLLBACK.';
        ROLLBACK TRANSACTION;
        RETURN;
    END

    INSERT INTO Pagos (IdContrato, Monto, FechaPago)
    VALUES (@IdContrato, @MontoPago, GETDATE());

    
    UPDATE Contratos
    SET FechaFin = DATEADD(DAY, @DuracionDias, FechaFin)
    WHERE IdContrato = @IdContrato
    COMMIT TRANSACTION;
    PRINT 'Renovación realizada correctamente.';

END TRY
BEGIN CATCH
    PRINT 'Ocurrió un error inesperado. Se ejecuta ROLLBACK.';
    ROLLBACK TRANSACTION;

    PRINT ERROR_MESSAGE();
END CATCH;
