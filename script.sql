USE userdb;

CREATE TABLE meals_types(
  id INT AUTO_INCREMENT PRIMARY KEY,
  meal_type VARCHAR(50) NOT NULL
);

INSERT INTO meals_types (meal_type) VALUES ('pasta');
INSERT INTO meals_types (meal_type) VALUES ('pizza');


CREATE TABLE dish (
  id INT AUTO_INCREMENT PRIMARY KEY,
  meal_type_id INT,
  meal_name VARCHAR(50) NOT NULL,
  cooking_time_min INT(3) NOT NULL,
  FOREIGN KEY (meal_type_id) REFERENCES meals_types(id)
);

INSERT INTO dish ( meal_type_id,meal_name, cooking_time_min) VALUES (1, 'bolognese', 65);
INSERT INTO dish ( meal_type_id,meal_name, cooking_time_min) VALUES (1, 'alfredo', 30);
INSERT INTO dish ( meal_type_id,meal_name, cooking_time_min) VALUES ( 1,'carbonara', 25);
INSERT INTO dish ( meal_type_id, meal_name, cooking_time_min) VALUES ( 2,'margarita', 20);
INSERT INTO dish ( meal_type_id,meal_name, cooking_time_min) VALUES ( 2,'peperoni', 30);
INSERT INTO dish ( meal_type_id, meal_name, cooking_time_min) VALUES ( 2,'capricciosa', 35);

CREATE TABLE ingredients (
  id INT AUTO_INCREMENT PRIMARY KEY,
  ingredient VARCHAR(100) NOT NULL
);

INSERT INTO ingredients(ingredient) VALUES ('spaghetti'),('chopped meat'),('pizza dough'),('bacon'), ('egg'),('parmesan'),('black paper'),('white paper'),('salt'),('tomato'),('tomato sauce'),('mozzarella'), ('basil'), ('olive oil'),('ham'),('mushroom'),('artichoke'),('oregano'),('celery'),('onion'),('carrot'),('cream'),('butter'),('peperoni'),('fettucini'),('olives');

CREATE TABLE dish_ingredients (
  id INT AUTO_INCREMENT PRIMARY KEY,
  meal_type_id INT,
  dish_id INT,
  ingredient_id INT,
  FOREIGN KEY (dish_id) REFERENCES dish(id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients(id),
  FOREIGN KEY (meal_type_id) REFERENCES meals_types(id)
);

INSERT INTO dish_ingredients(meal_type_id, dish_id, ingredient_id) VALUES (1,1,1),(1,1,2),(1,1,20),(1,1,21),(1,1,19),(1,1,10),(1,1,11),(1,1,9),(1,1,7),(1,1,8),(1,1,6);
INSERT INTO dish_ingredients(meal_type_id, dish_id, ingredient_id) VALUES (1,2,25),(1,2,22),(1,2,6),(1,2,9),(1,2,8);
INSERT INTO dish_ingredients(meal_type_id, dish_id, ingredient_id) VALUES (1,3,1),(1,3,4),(1,3,5),(1,3,6),(1,3,7),(1,3,9);
INSERT INTO dish_ingredients(meal_type_id, dish_id, ingredient_id) VALUES (2,4,3),(2,4,11),(2,4,12),(2,4,13),(2,4,14),(2,4,9),(2,4,7);
INSERT INTO dish_ingredients(meal_type_id, dish_id, ingredient_id) VALUES (2,5,3),(2,5,11),(2,5,12),(2,5,24),(2,5,14),(2,5,18),(2,5,7);
INSERT INTO dish_ingredients(meal_type_id, dish_id, ingredient_id) VALUES (2,6,3),(2,6,11),(2,6,12),(2,6,15),(2,6,16),(2,6,17),(2,6,18),(2,6,9),(2,6,7),(2,6,26);

CREATE TABLE processes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  process VARCHAR(50)
); 

INSERT INTO processes(process) VALUES ('boil'),('fry'),('slice'),('roll out dough'),('stew'),('bake');

CREATE TABLE dish_preparing_processes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  dish_id INT,
  process_id INT,
  FOREIGN KEY (process_id) REFERENCES processes(id),
  FOREIGN KEY (dish_id) REFERENCES dish(id)
);

INSERT INTO dish_preparing_processes( dish_id, process_id) VALUES (1,1),(1,3),(1,5);
INSERT INTO dish_preparing_processes( dish_id, process_id) VALUES (2,1),(2,3),(2,5);
INSERT INTO dish_preparing_processes( dish_id, process_id) VALUES (3,1),(3,2),(3,2);
INSERT INTO dish_preparing_processes( dish_id, process_id) VALUES (4,4),(4,3),(4,6);
INSERT INTO dish_preparing_processes( dish_id, process_id) VALUES (5,4),(5,3),(5,6);
INSERT INTO dish_preparing_processes( dish_id, process_id) VALUES (6,4),(6,3),(6,6);
