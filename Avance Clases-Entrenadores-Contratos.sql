CREATE TABLE Entrenadores (
    IdEntrenador INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Especialidad NVARCHAR(100) NULL
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


INSERT INTO Contratos (IdMiembro, IdMembresia, FechaInicio, FechaFin) VALUES
(1,1,'2025-01-01','2025-01-31'),
(2,5,'2025-01-01','2025-12-31'),
(3,2,'2025-01-15','2025-04-14');
GO
