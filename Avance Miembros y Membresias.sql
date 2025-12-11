
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

INSERT INTO Membresias (Nombre, Costo, DuracionDias) VALUES
('Mensual', 25000.00, 30),
('Trimestral', 70000.00, 90),
('Semestral', 130000.00, 180),
('Anual', 240000.00, 365),
('VIP', 350000.00, 365);
GO
