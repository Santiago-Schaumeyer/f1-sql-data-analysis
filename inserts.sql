-- =========================
-- EQUIPOS
-- =========================

INSERT INTO equipos (id, nombre) VALUES
(1, 'Williams'),
(2, 'Mercedes'),
(3, 'Aston Martin'),
(4, 'Ferrari'),
(5, 'McLaren'),
(6, 'Benetton'),
(7, 'Renault'),
(8, 'Alpine'),
(9, 'Lotus'),
(10, 'Jordan');

-- =========================
-- PILOTOS
-- =========================

INSERT INTO pilotos (id, nombre) VALUES
(1, 'Franco Colapinto'),
(2, 'Lewis Hamilton'),
(3, 'Fernando Alonso'),
(4, 'Michael Schumacher'),
(5, 'Ayrton Senna');

-- =========================
-- RELACIÓN PILOTO - EQUIPO
-- =========================

INSERT INTO piloto_equipo (piloto_id, equipo_id, fecha_inicio, fecha_fin) VALUES

-- Franco Colapinto
(1, 1, '2024-01-01', '2024-12-31'), -- Williams
(1, 8, '2025-01-01', NULL),         -- Alpine

-- Lewis Hamilton
(2, 5, '2007-01-01', '2012-12-31'), -- McLaren
(2, 2, '2013-01-01', '2024-12-31'), -- Mercedes
(2, 4, '2025-01-01', NULL),         -- Ferrari 

-- Fernando Alonso
(3, 7, '2003-01-01', '2006-12-31'), -- Renault
(3, 5, '2007-01-01', '2007-12-31'), -- McLaren
(3, 7, '2008-01-01', '2009-12-31'), -- Renault
(3, 4, '2010-01-01', '2014-12-31'), -- Ferrari
(3, 5, '2015-01-01', '2018-12-31'), -- McLaren
(3, 8, '2021-01-01', '2022-12-31'), -- Alpine
(3, 3, '2023-01-01', NULL),         -- Aston Martin

-- Michael Schumacher
(4, 10, '1991-01-01', '1991-12-31'), -- Jordan
(4, 6, '1992-01-01', '1995-12-31'),  -- Benetton
(4, 4, '1996-01-01', '2006-12-31'),  -- Ferrari
(4, 2, '2010-01-01', '2012-12-31'),  -- Mercedes

-- Ayrton Senna
(5, 9, '1985-01-01', '1987-12-31'), -- Lotus
(5, 5, '1988-01-01', '1993-12-31'), -- McLaren
(5, 1, '1994-01-01', '1994-12-31'); -- Williams

-- =========================
-- CIRCUITOS
-- =========================

INSERT INTO circuitos (id, nombre, pais, longitud_km) VALUES
(1, 'Monza', 'Italia', 5.79),
(2, 'Silverstone', 'Reino Unido', 5.89);

-- =========================
-- CARRERAS
-- =========================

INSERT INTO carreras (id, circuito_id, fecha) VALUES
(1, 1, '2024-09-01'),
(2, 2, '2024-07-15');

-- =========================
-- SISTEMA A (CORRECTO)
-- =========================

INSERT INTO laps_sistema_a (piloto_id, carrera_id, vuelta, tiempo_vuelta) VALUES
(1,1,1,82.345),
(1,1,2,81.900),
(2,1,1,81.200),
(2,1,2,81.000),
(3,1,1,82.100),
(3,1,2,81.950);

-- =========================
-- SISTEMA B (CON ERRORES)
-- =========================

INSERT INTO laps_sistema_b (piloto_id, carrera_id, vuelta, tiempo_vuelta) VALUES
(1,1,1,82.345),
(1,1,2,81.900),
(2,1,1,81.200),
(2,1,2,82.500), -- error
(3,1,1,82.100),
(3,1,1,82.100); -- duplicado