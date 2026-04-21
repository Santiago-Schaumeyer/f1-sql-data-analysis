-- =========================
-- TABLAS MAESTRAS
-- =========================

CREATE TABLE equipos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE pilotos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE circuitos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(100),
    longitud_km NUMERIC(5,2)
);

CREATE TABLE carreras (
    id SERIAL PRIMARY KEY,
    circuito_id INT NOT NULL,
    fecha DATE NOT NULL,

    FOREIGN KEY (circuito_id) REFERENCES circuitos(id)
);

-- =========================
-- RELACIÓN TEMPORAL
-- =========================

CREATE TABLE piloto_equipo (
    id SERIAL PRIMARY KEY,
    piloto_id INT NOT NULL,
    equipo_id INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,

    FOREIGN KEY (piloto_id) REFERENCES pilotos(id),
    FOREIGN KEY (equipo_id) REFERENCES equipos(id),

    CONSTRAINT chk_fechas CHECK (fecha_fin IS NULL OR fecha_fin >= fecha_inicio)
);

-- =========================
-- TABLAS TRANSACCIONALES
-- =========================

-- Sistema A (datos confiables)
CREATE TABLE laps_sistema_a (
    id SERIAL PRIMARY KEY,
    piloto_id INT NOT NULL,
    carrera_id INT NOT NULL,
    vuelta INT NOT NULL,
    tiempo_vuelta NUMERIC(6,3) NOT NULL,

    FOREIGN KEY (piloto_id) REFERENCES pilotos(id),
    FOREIGN KEY (carrera_id) REFERENCES carreras(id),

    CONSTRAINT unique_lap_a UNIQUE (piloto_id, carrera_id, vuelta),
    CONSTRAINT chk_vuelta_a CHECK (vuelta > 0)
);

-- Sistema B (puede tener errores)
CREATE TABLE laps_sistema_b (
    id SERIAL PRIMARY KEY,
    piloto_id INT NOT NULL,
    carrera_id INT NOT NULL,
    vuelta INT NOT NULL,
    tiempo_vuelta NUMERIC(6,3),

    FOREIGN KEY (piloto_id) REFERENCES pilotos(id),
    FOREIGN KEY (carrera_id) REFERENCES carreras(id),

    CONSTRAINT chk_vuelta_b CHECK (vuelta > 0)
);