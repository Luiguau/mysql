-- Consultas
-- 1. ¿Qué consulta harías para obtener todos los países que hablan esloveno? Tu consulta debe devolver el nombre del país, el idioma y el porcentaje de idioma. 
-- 	  Tu consulta debe organizar el resultado por porcentaje de idioma en orden descendente. (1)
SELECT co.name, l.language, la.percentage FROM countries co, languages la WHERE l.language='slovene' AND la.country_id=co.id ORDER BY la.percentage DESC;

-- 2. ¿Qué consulta ejecutarías para mostrar el número total de ciudades para cada país? Su consulta debe devolver el nombre del país y el número total de ciudades. 
--	  Tu consulta debe organizar el resultado por el número de ciudades en orden descendente. (3)
SELECT co.name, COUNT(ci.country_id) as 'cities' FROM countries co, cities ci WHERE co.id=ci.country_id GROUP BY ci.country_id ORDER BY cities DESC;

-- 3. ¿Qué consulta harías para obtener todas las ciudades de México con una población de más de 500,000? 
--    Tu consulta debe organizar el resultado por población en orden descendente. (1)
SELECT ci.name, ci.population, co.name FROM countries co, cities ci WHERE co.id=ci.country_id AND ci.population > 500000 AND co.name='Mexico' ORDER BY ci.population DESC;

-- 4. ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país con un porcentaje superior al 89%? 
--    Tu consulta debe organizar el resultado por porcentaje en orden descendente. (1)
SELECT co.name, la.language, la.percentage FROM countries co, languages la WHERE co.id=la.country_id AND la.percentage > 89 ORDER BY la.percentage DESC;

-- 5. ¿Qué consulta haría para obtener todos los países con un área de superficie inferior a 501 y una población superior a 100,000? (2)
SELECT name, surface_area, population FROM countries WHERE surface_area < 501 AND population > 100000;

-- 6. ¿Qué consulta harías para obtener países con solo Monarquía Constitucional con un capital superior a 200 y una esperanza de vida superior a 75 años? (1)
SELECT name, government_form, capital, life_expectancy FROM countries WHERE government_form='Constitutional Monarchy' AND capital > 200 AND life_expectancy > 75;

-- 7. ¿Qué consulta harías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires y tener una población superior a 500,000? 
	La consulta debe devolver el nombre del país, el nombre de la ciudad, el distrito y la población. (2)
SELECT co.name as "country_name", ci.name as 'city_name', ci.district, ci.population FROM countries co, cities ci WHERE co.id=ci.country_id AND co.name='Argentina' AND ci.district='Buenos Aires' and ci.population > 500000;

-- 8. ¿Qué consulta harías para resumir el número de países en cada región? La consulta debe mostrar el nombre de la región y el número de países.
--    Además, la consulta debe organizar el resultado por el número de países en orden descendente. (2)
SELECT region, COUNT(name) as 'countries' FROM countries GROUP BY region ORDER BY countries DESC;