SELECT i.image_link FROM Breed b
JOIN Image i ON b.id = i.breed_id
WHERE b.id = 1;


SELECT ARRAY_AGG(i.image_link) AS image_links
FROM Breed b
JOIN Image i ON b.id = i.breed_id
WHERE b.id = 1;
