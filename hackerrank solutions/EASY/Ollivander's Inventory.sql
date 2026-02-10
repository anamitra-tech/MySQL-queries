SELECT
    w.id,
    wp.age,
    w.coins_needed,
    w.power
FROM Wands w
JOIN Wands_Property wp
    ON w.code = wp.code
WHERE wp.is_evil = 0
  AND w.id = (
        SELECT w2.id
        FROM Wands w2
        JOIN Wands_Property wp2
            ON w2.code = wp2.code
        WHERE wp2.is_evil = 0
          AND w2.power = w.power
          AND wp2.age = wp.age
        ORDER BY w2.coins_needed ASC
        LIMIT 1
    )
ORDER BY
    w.power DESC,
    wp.age DESC;
