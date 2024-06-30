INSERT INTO BreedOrigin (breed_id, origin_id)
SELECT b.id, o.country_id FROM Breed b, Origin o
WHERE b.name = 'Abyssinian' AND o.country_name = 'Iran';