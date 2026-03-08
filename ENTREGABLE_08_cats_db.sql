-- ============================================================
-- GA-CATS-01 · SENA CEET · ADSO
-- Base de Datos: cats-db (Azure SQL Database)
-- Razas: Abisinio, Bengala, Maine Coon, Pelo Corto,
--        Persa, Ragdoll, Siamés, Sphynx
-- ============================================================

-- ────────────────────────────────────────────────────────────
-- 1. TABLAS
-- ────────────────────────────────────────────────────────────

CREATE TABLE Raza (
    RazaId        INT           IDENTITY(1,1) PRIMARY KEY,
    NombreRaza    NVARCHAR(80)  NOT NULL UNIQUE,
    Origen        NVARCHAR(100) NOT NULL,
    Descripcion   NVARCHAR(255) NOT NULL,
    NivelActividad NVARCHAR(20) NOT NULL CHECK (NivelActividad IN ('Bajo','Medio','Alto')),
    EsperanzaVida NVARCHAR(20)  NOT NULL
);

CREATE TABLE FichaTecnica (
    FichaId       INT           IDENTITY(1,1) PRIMARY KEY,
    RazaId        INT           NOT NULL REFERENCES Raza(RazaId) ON DELETE CASCADE,
    PesoKg        NVARCHAR(20)  NOT NULL,
    TemperaIento  NVARCHAR(255) NOT NULL,
    CuidadoPelo   NVARCHAR(20)  NOT NULL CHECK (CuidadoPelo IN ('Bajo','Medio','Alto')),
    NivelEnergia  NVARCHAR(20)  NOT NULL CHECK (NivelEnergia IN ('Bajo','Medio','Alto')),
    Inteligencia  NVARCHAR(20)  NOT NULL CHECK (Inteligencia IN ('Media','Alta','Muy alta'))
);

CREATE TABLE Multimedia (
    MultimediaId  INT           IDENTITY(1,1) PRIMARY KEY,
    RazaId        INT           NOT NULL REFERENCES Raza(RazaId) ON DELETE CASCADE,
    TipoArchivo   NVARCHAR(10)  NOT NULL CHECK (TipoArchivo IN ('imagen','video','pdf')),
    UrlBlob       NVARCHAR(500) NOT NULL,
    NombreArchivo NVARCHAR(200) NOT NULL,
    FechaSubida   DATE          NOT NULL DEFAULT GETDATE()
);

CREATE TABLE Color (
    ColorId       INT           IDENTITY(1,1) PRIMARY KEY,
    RazaId        INT           NOT NULL REFERENCES Raza(RazaId) ON DELETE CASCADE,
    NombreColor   NVARCHAR(60)  NOT NULL,
    CodigoHex     CHAR(7)       NOT NULL
);

-- ────────────────────────────────────────────────────────────
-- 2. INSERT — Raza
-- ────────────────────────────────────────────────────────────

INSERT INTO Raza (NombreRaza, Origen, Descripcion, NivelActividad, EsperanzaVida) VALUES
('Abisinio',   'Etiopía',        'Ágil y curioso, siempre en movimiento',         'Alto',  '12-15 años'),
('Bengala',    'Estados Unidos',  'Salvaje por fuera, tierno por dentro',           'Alto',  '12-16 años'),
('Maine Coon', 'Estados Unidos',  'El gigante gentil de los gatos',                'Medio', '12-15 años'),
('Pelo Corto', 'Mundial',         'Elegante y de bajo mantenimiento',              'Medio', '13-17 años'),
('Persa',      'Irán',            'Majestuoso y tranquilo como un rey',            'Bajo',  '12-17 años'),
('Ragdoll',    'Estados Unidos',  'Se derrite entre tus brazos',                   'Bajo',  '12-17 años'),
('Siamés',     'Tailandia',       'Vocal, social y muy inteligente',               'Alto',  '15-20 años'),
('Sphynx',     'Canadá',          'Sin pelo, lleno de amor y calor',               'Alto',  '12-14 años');

-- ────────────────────────────────────────────────────────────
-- 3. INSERT — FichaTecnica
-- ────────────────────────────────────────────────────────────

INSERT INTO FichaTecnica (RazaId, PesoKg, TemperaIento, CuidadoPelo, NivelEnergia, Inteligencia)
SELECT RazaId, PesoKg, TemperaIento, CuidadoPelo, NivelEnergia, Inteligencia
FROM (VALUES
    ('Abisinio',   '3-5 kg',  'Activo, juguetón, independiente',            'Bajo',  'Alto',  'Alta'),
    ('Bengala',    '4-7 kg',  'Curioso, enérgico, sociable',                'Medio', 'Alto',  'Muy alta'),
    ('Maine Coon', '5-9 kg',  'Amigable, tranquilo, sociable con niños',    'Medio', 'Medio', 'Alta'),
    ('Pelo Corto', '3-5 kg',  'Adaptable, cariñoso, fácil de cuidar',      'Bajo',  'Medio', 'Media'),
    ('Persa',      '3-6 kg',  'Tranquilo, afectuoso, sedentario',           'Alto',  'Bajo',  'Media'),
    ('Ragdoll',    '4-8 kg',  'Dócil, cariñoso, ideal para familias',      'Medio', 'Bajo',  'Alta'),
    ('Siamés',     '3-5 kg',  'Vocal, leal, muy apegado a su dueño',       'Bajo',  'Alto',  'Muy alta'),
    ('Sphynx',     '3-5 kg',  'Extrovertido, travieso, muy sociable',      'Alto',  'Alto',  'Alta')
) AS src(NombreRaza, PesoKg, TemperaIento, CuidadoPelo, NivelEnergia, Inteligencia)
JOIN Raza r ON r.NombreRaza = src.NombreRaza;

-- ────────────────────────────────────────────────────────────
-- 4. INSERT — Multimedia (Blob Storage)
-- Contenedor: storagecatssena / cats
-- ────────────────────────────────────────────────────────────

INSERT INTO Multimedia (RazaId, TipoArchivo, UrlBlob, NombreArchivo)
SELECT r.RazaId, m.TipoArchivo, m.UrlBlob, m.NombreArchivo
FROM (VALUES
    ('Abisinio',   'imagen', 'https://storagecatssena.blob.core.windows.net/cats/cats/Abisinio.jpg',         'Abisinio.jpg'),
    ('Abisinio',   'video',  'https://storagecatssena.blob.core.windows.net/cats/cats-video/Abisinio.mp4',   'Abisinio.mp4'),
    ('Abisinio',   'pdf',    'https://storagecatssena.blob.core.windows.net/cats/cats-pdf/Abisinio.pdf',     'Abisinio.pdf'),
    ('Bengala',    'imagen', 'https://storagecatssena.blob.core.windows.net/cats/cats/Bengala.jpg',          'Bengala.jpg'),
    ('Bengala',    'video',  'https://storagecatssena.blob.core.windows.net/cats/cats-video/Bengala.mp4',    'Bengala.mp4'),
    ('Bengala',    'pdf',    'https://storagecatssena.blob.core.windows.net/cats/cats-pdf/Bengala.pdf',      'Bengala.pdf'),
    ('Maine Coon', 'imagen', 'https://storagecatssena.blob.core.windows.net/cats/cats/Maine_Coon.jpg',       'Maine_Coon.jpg'),
    ('Maine Coon', 'video',  'https://storagecatssena.blob.core.windows.net/cats/cats-video/Maine_Coon.mp4', 'Maine_Coon.mp4'),
    ('Maine Coon', 'pdf',    'https://storagecatssena.blob.core.windows.net/cats/cats-pdf/Maine_Coon.pdf',   'Maine_Coon.pdf'),
    ('Pelo Corto', 'imagen', 'https://storagecatssena.blob.core.windows.net/cats/cats/Pelo_Corto.jpg',       'Pelo_Corto.jpg'),
    ('Pelo Corto', 'video',  'https://storagecatssena.blob.core.windows.net/cats/cats-video/Pelo_Corto.mp4', 'Pelo_Corto.mp4'),
    ('Pelo Corto', 'pdf',    'https://storagecatssena.blob.core.windows.net/cats/cats-pdf/Pelo_Corto.pdf',   'Pelo_Corto.pdf'),
    ('Persa',      'imagen', 'https://storagecatssena.blob.core.windows.net/cats/cats/Persa.jpg',            'Persa.jpg'),
    ('Persa',      'video',  'https://storagecatssena.blob.core.windows.net/cats/cats-video/Persa.mp4',      'Persa.mp4'),
    ('Persa',      'pdf',    'https://storagecatssena.blob.core.windows.net/cats/cats-pdf/Persa.pdf',        'Persa.pdf'),
    ('Ragdoll',    'imagen', 'https://storagecatssena.blob.core.windows.net/cats/cats/Ragdoll.jpg',          'Ragdoll.jpg'),
    ('Ragdoll',    'video',  'https://storagecatssena.blob.core.windows.net/cats/cats-video/Ragdoll.mp4',    'Ragdoll.mp4'),
    ('Ragdoll',    'pdf',    'https://storagecatssena.blob.core.windows.net/cats/cats-pdf/Ragdoll.pdf',      'Ragdoll.pdf'),
    ('Siamés',     'imagen', 'https://storagecatssena.blob.core.windows.net/cats/cats/Siames.jpg',           'Siames.jpg'),
    ('Siamés',     'video',  'https://storagecatssena.blob.core.windows.net/cats/cats-video/Siames.mp4',     'Siames.mp4'),
    ('Siamés',     'pdf',    'https://storagecatssena.blob.core.windows.net/cats/cats-pdf/Siames.pdf',       'Siames.pdf'),
    ('Sphynx',     'imagen', 'https://storagecatssena.blob.core.windows.net/cats/cats/Sphynx.jpg',           'Sphynx.jpg'),
    ('Sphynx',     'video',  'https://storagecatssena.blob.core.windows.net/cats/cats-video/Sphynx.mp4',     'Sphynx.mp4'),
    ('Sphynx',     'pdf',    'https://storagecatssena.blob.core.windows.net/cats/cats-pdf/Sphynx.pdf',       'Sphynx.pdf')
) AS m(NombreRaza, TipoArchivo, UrlBlob, NombreArchivo)
JOIN Raza r ON r.NombreRaza = m.NombreRaza;

-- ────────────────────────────────────────────────────────────
-- 5. INSERT — Color
-- ────────────────────────────────────────────────────────────

INSERT INTO Color (RazaId, NombreColor, CodigoHex)
SELECT r.RazaId, c.NombreColor, c.CodigoHex
FROM (VALUES
    ('Abisinio',   'Leonado',       '#C9883A'),
    ('Bengala',    'Moteado dorado','#D4A843'),
    ('Maine Coon', 'Marrón tabby',  '#7B4F2E'),
    ('Pelo Corto', 'Azul plateado', '#A8B8C8'),
    ('Persa',      'Blanco perla',  '#F5F0E8'),
    ('Ragdoll',    'Seal point',    '#3D2B1F'),
    ('Siamés',     'Seal point',    '#2C1810'),
    ('Sphynx',     'Piel rosada',   '#E8C4A0')
) AS c(NombreRaza, NombreColor, CodigoHex)
JOIN Raza r ON r.NombreRaza = c.NombreRaza;

-- ────────────────────────────────────────────────────────────
-- 6. CONSULTAS DE VERIFICACIÓN
-- ────────────────────────────────────────────────────────────

SELECT r.NombreRaza, r.Origen, r.NivelActividad, r.EsperanzaVida,
       f.PesoKg, f.NivelEnergia, f.Inteligencia
FROM Raza r
JOIN FichaTecnica f ON f.RazaId = r.RazaId
ORDER BY r.NombreRaza;

SELECT r.NombreRaza, m.TipoArchivo, m.NombreArchivo
FROM Multimedia m
JOIN Raza r ON r.RazaId = m.RazaId
ORDER BY r.NombreRaza, m.TipoArchivo;
