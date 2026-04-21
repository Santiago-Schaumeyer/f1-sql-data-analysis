-- Equipos de cada piloto con fechas de inicio y fin.
SELECT 
    p.nombre AS piloto,
    e.nombre AS equipo,
    pe.fecha_inicio,
    CASE 
        WHEN pe.fecha_fin IS NULL THEN 'Current'
        ELSE pe.fecha_fin::text
    END AS fecha_fin
FROM piloto_equipo pe
JOIN pilotos p ON p.id = pe.piloto_id
JOIN equipos e ON e.id = pe.equipo_id
ORDER BY p.nombre, pe.fecha_inicio;
