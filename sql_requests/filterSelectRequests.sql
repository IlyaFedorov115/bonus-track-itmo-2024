SELECT id, name FROM Breed
WHERE length_to > 18 AND max_weight <= 15;


SELECT id, name, avg_life_expectancy
FROM (SELECT id, name, 
     (min_life_expectancy + max_life_expectancy) / 2 AS avg_life_expectancy
    FROM Breed) AS bs
WHERE avg_life_expectancy > 12 AND avg_life_expectancy < 14;


SELECT b.id, b.name FROM Breed b
JOIN SpecialCharacteristic sc 
ON b.spec_characteristic_id = sc.ch_id
WHERE sc.hypoallergenic = TRUE;


SELECT b.id, b.name, s.children_friendly, s.intelligence, s.hypoallergenic
FROM Breed b
JOIN SpecialCharacteristic s ON b.spec_characteristic_id = s.ch_id
WHERE s.children_friendly >= 4 AND 
s.intelligence > 4 AND s.hypoallergenic = TRUE;