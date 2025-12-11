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

INSERT INTO Pagos (IdContrato, Monto, FechaPago) VALUES
(1,25000.00,'2025-01-01'),
(2,350000.00,'2025-01-02'),
(3,70000.00,'2025-01-15');
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