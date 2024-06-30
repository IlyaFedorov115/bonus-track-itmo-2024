SELECT 
    b.id, b.name, b.min_life_expectancy, b.max_life_expectancy, 
    b.length_from, b.length_to,  b.min_weight, b.max_weight, i.image_link,
    array_agg(o.country_name) AS countries
FROM Breed b
LEFT JOIN (SELECT DISTINCT ON (breed_id) breed_id, image_link 
FROM Image ORDER BY breed_id, image_link) i ON b.id = i.breed_id
LEFT JOIN BreedOrigin bo ON b.id = bo.breed_id
LEFT JOIN Origin o ON bo.origin_id = o.country_id
GROUP BY b.id, i.image_link;