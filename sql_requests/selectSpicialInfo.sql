SELECT 
    b.name, s.family_friendly, s.shedding, s.general_health, 
    s.playfulness, s.children_friendly, s.grooming, 
    s.intelligence, s.other_pets_friendly, s.hypoallergenic
FROM Breed b
LEFT JOIN SpecialCharacteristic s 
ON b.spec_characteristic_id = s.ch_id
WHERE b.id = 1;