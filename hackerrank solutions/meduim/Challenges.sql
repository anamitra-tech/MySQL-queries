WITH challenge_counts AS (
    SELECT h.hacker_id, h.name, COUNT(c.challenge_id) AS total
    FROM Hackers h
    JOIN Challenges c
        ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, h.name
),
max_count AS (
    SELECT MAX(total) AS max_total
    FROM challenge_counts
)
SELECT cc.hacker_id, cc.name, cc.total
FROM challenge_counts cc
WHERE 
    cc.total = (SELECT max_total FROM max_count)
    OR cc.total IN (
        SELECT total
        FROM challenge_counts
        GROUP BY total
        HAVING COUNT(*) = 1
    )
ORDER BY cc.total DESC, cc.hacker_id;
