-- DDL for Table HOROSCOPO
CREATE TABLE horoscopo (
                           animal VARCHAR(30) NOT NULL,
                           fecha_inicio DATE NOT NULL,
                           fecha_fin DATE NOT NULL,
                           id_hor BIGINT
);

-- Inserts data into HOROSCOPO
INSERT INTO horoscopo (animal, fecha_inicio, fecha_fin, id_hor) VALUES
                                                                    ('Rata', '2024-02-05', '2025-01-24', NULL),
                                                                    ('Buey', '2025-01-25', '2026-02-12', NULL),
                                                                    ('Tigre', '2026-02-13', '2027-02-01', NULL),
                                                                    ('Conejo', '2027-02-02', '2028-01-22', NULL),
                                                                    ('Dragón', '2028-01-23', '2029-02-09', NULL),
                                                                    ('Serpiente', '2029-02-10', '2030-01-29', NULL),
                                                                    ('Caballo', '2030-01-30', '2031-02-16', NULL),
                                                                    ('Cabra', '2031-02-17', '2032-02-05', NULL),
                                                                    ('Mono', '2032-02-06', '2033-01-25', NULL),
                                                                    ('Gallo', '2033-01-26', '2034-02-13', NULL),
                                                                    ('Perro', '2034-02-14', '2035-02-03', NULL),
                                                                    ('Cerdo', '2035-02-04', '2036-01-23', NULL),
                                                                    ('Rata', '2036-01-24', '2037-02-10', NULL),
                                                                    ('Buey', '2037-02-11', '2038-01-30', NULL),
                                                                    ('Tigre', '2038-01-31', '2039-02-18', NULL),
                                                                    ('Conejo', '2039-02-19', '2040-02-07', NULL),
                                                                    ('Dragón', '2040-02-08', '2041-01-26', NULL),
                                                                    ('Serpiente', '2041-01-27', '2042-02-14', NULL),
                                                                    ('Caballo', '2042-02-15', '2043-02-04', NULL),
                                                                    ('Cabra', '2043-02-05', '2044-01-24', NULL),
                                                                    ('Mono', '2044-01-25', '2045-02-12', NULL),
                                                                    ('Gallo', '2045-02-13', '2046-02-01', NULL),
                                                                    ('Perro', '2046-02-02', '2047-01-21', NULL),
                                                                    ('Cerdo', '2047-01-22', '2048-02-09', NULL),
                                                                    ('Rata', '2048-02-10', '2049-01-28', NULL),
                                                                    ('Buey', '2049-01-29', '2050-02-16', NULL),
                                                                    ('Tigre', '2050-02-17', '2051-02-05', NULL),
                                                                    ('Conejo', '2051-02-06', '2052-01-26', NULL),
                                                                    ('Dragón', '2052-01-27', '2053-02-13', NULL),
                                                                    ('Serpiente', '2053-02-14', '2054-02-02', NULL),
                                                                    ('Caballo', '2054-02-03', '2055-01-23', NULL),
                                                                    ('Cabra', '2055-01-24', '2056-02-11', NULL),
                                                                    ('Mono', '2056-02-12', '2057-01-30', NULL),
                                                                    ('Gallo', '2057-01-31', '2058-02-17', NULL),
                                                                    ('Perro', '2058-02-18', '2059-02-07', NULL),
                                                                    ('Cerdo', '2059-02-08', '2060-01-27', NULL),
                                                                    ('Rata', '2060-01-28', '2061-02-14', NULL),
                                                                    ('Buey', '2061-02-15', '2062-02-04', NULL),
                                                                    ('Tigre', '2062-02-05', '2063-01-24', NULL),
                                                                    ('Conejo', '2063-01-25', '2064-02-12', NULL),
                                                                    ('Dragón', '2064-02-13', '2065-02-01', NULL),
                                                                    ('Serpiente', '2065-02-02', '2066-01-20', NULL),
                                                                    ('Caballo', '2066-01-21', '2067-02-08', NULL),
                                                                    ('Cabra', '2067-02-09', '2068-01-29', NULL),
                                                                    ('Mono', '2068-01-30', '2069-02-16', NULL),
                                                                    ('Gallo', '2069-02-17', '2070-02-05', NULL),
                                                                    ('Perro', '2070-02-06', '2071-01-26', NULL),
                                                                    ('Cerdo', '2071-01-27', '2072-02-14', NULL),
                                                                    ('Rata', '2072-02-15', '2073-02-02', NULL);

-- DDL for Table USUARIOS
CREATE TABLE usuarios (
                          id SERIAL PRIMARY KEY,
                          nombre VARCHAR(30),
                          username VARCHAR(30) UNIQUE,
                          email VARCHAR(30) UNIQUE,
                          fecha_nacimiento DATE,
                          password VARCHAR(30),
                          animal VARCHAR(30)
);

-- Insert sample data into USUARIOS
INSERT INTO usuarios (id, nombre, username, email, fecha_nacimiento, password, animal) VALUES
                                                                                           (1, 'Juan Pérez', 'juanp', 'juan.perez@example.com', '1990-01-01', 'securepassword', NULL),
                                                                                           (2, 'Macarena', 'Maca', 'macaparedes@example.com', '1988-09-20', 'maca123', NULL);
