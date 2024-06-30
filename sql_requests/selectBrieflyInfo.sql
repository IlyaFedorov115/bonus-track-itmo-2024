SELECT 
    b.id, b.name, b.min_life_expectancy,  b.max_life_expectancy, b.length_from, 
    b.length_to, b.min_weight, b.max_weight, b.description, i.image_link
FROM Breed b
LEFT JOIN (SELECT DISTINCT ON (breed_id) breed_id, image_link 
FROM Image ORDER BY breed_id, image_link) i 
ON b.id = i.breed_id;