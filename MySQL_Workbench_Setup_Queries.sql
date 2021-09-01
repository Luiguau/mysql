USE hogwarts;
SELECT * FROM wizards_wizard;
INSERT INTO wizards_wizard (name, house, pet, year) VALUES ('Draco Malfoy', 'Slytherin', 'None', '2');
SELECT id, name FROM wizards_wizard WHERE house='Ravenclaw';
UPDATE wizards_wizard SET year='7' WHERE name='Draco Malfoy';
SELECT * FROM wizards_wizard;
DELETE FROM wizards_wizard WHERE id='6';
SELECT * FROM wizards_wizard;
