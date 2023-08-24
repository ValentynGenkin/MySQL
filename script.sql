
CREATE TABLE Categories(
  id INT AUTO_INCREMENT PRIMARY KEY,
  Dish_category VARCHAR(50) NOT NULL
);

INSERT INTO Categories (Dish_category) VALUES ('pasta');
INSERT INTO Categories (Dish_category) VALUES ('pizza');


CREATE TABLE Recipes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  Recipe VARCHAR(50) NOT NULL
);

INSERT INTO Recipes (Recipe) VALUES ('bolognese');
INSERT INTO Recipes (Recipe) VALUES ('alfredo');
INSERT INTO Recipes (Recipe) VALUES ('carbonara');
INSERT INTO Recipes (Recipe) VALUES ('margarita');
INSERT INTO Recipes (Recipe) VALUES ('peperoni');
INSERT INTO Recipes (Recipe) VALUES ('capricciosa');

CREATE TABLE Recipe_category (
  id INT AUTO_INCREMENT PRIMARY KEY,
  Recipe_id INT,
  Dish_category_id INT,
  FOREIGN KEY (Recipe_id) REFERENCES Recipes(id),
  FOREIGN KEY (Dish_category_id) REFERENCES Categories(id)
);

INSERT INTO Recipe_category(Recipe_id, Dish_category_id) VALUES (1,1),(2,1),(3,1),(4,2),(5,2),(6,2);

CREATE TABLE ingredients (
  id INT AUTO_INCREMENT PRIMARY KEY,
  ingredient VARCHAR(100) NOT NULL
);

INSERT INTO ingredients(ingredient) VALUES ('spaghetti'),('chopped meat'),('pizza dough'),('bacon'), ('egg'),('parmesan'),('black paper'),('white paper'),('salt'),('tomato'),('tomato sauce'),('mozzarella'), ('basil'), ('olive oil'),('ham'),('mushroom'),('artichoke'),('oregano'),('celery'),('onion'),('carrot'),('cream'),('butter'),('peperoni'),('fettucini'),('olives');

CREATE TABLE Recipe_ingredients (
  id INT AUTO_INCREMENT PRIMARY KEY,
  Recipe_id INT,
  ingredient_id INT,
  FOREIGN KEY (Recipe_id) REFERENCES Recipes(id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients(id)
);


INSERT INTO Recipe_ingredients(Recipe_id, ingredient_id) VALUES (1,1),(1,2),(1,20),(1,21),(1,19),(1,10),(1,11),(1,9),(1,7),(1,8),(1,6);
INSERT INTO Recipe_ingredients(Recipe_id, ingredient_id) VALUES (2,25),(2,22),(2,6),(2,9),(2,8);
INSERT INTO Recipe_ingredients(Recipe_id, ingredient_id) VALUES (3,1),(3,4),(3,5),(3,6),(3,7),(3,9);
INSERT INTO Recipe_ingredients(Recipe_id, ingredient_id) VALUES (4,3),(4,11),(4,12),(4,13),(4,14),(4,9),(4,7);
INSERT INTO Recipe_ingredients(Recipe_id, ingredient_id) VALUES (5,3),(5,11),(5,12),(5,24),(5,14),(5,18),(5,7);
INSERT INTO Recipe_ingredients(Recipe_id, ingredient_id) VALUES (6,3),(6,11),(6,12),(6,15),(6,16),(6,17),(6,18),(6,9),(6,7),(6,26);

CREATE TABLE processes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  process VARCHAR(50)
); 

INSERT INTO processes(process) VALUES ('boil'),('fry'),('slice'),('roll out dough'),('stew'),('bake');

CREATE TABLE dish_preparing_processes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  Recipe_id INT,
  process_id INT,
  FOREIGN KEY (Recipe_id) REFERENCES Recipes(id),
  FOREIGN KEY (process_id) REFERENCES processes(id)
);

INSERT INTO dish_preparing_processes(Recipe_id, process_id) VALUES (1,1),(1,3),(1,5);
INSERT INTO dish_preparing_processes(Recipe_id, process_id) VALUES (2,1),(2,3),(2,5);
INSERT INTO dish_preparing_processes(Recipe_id, process_id) VALUES (3,1),(3,2),(3,2);
INSERT INTO dish_preparing_processes(Recipe_id, process_id) VALUES (4,4),(4,3),(4,6);
INSERT INTO dish_preparing_processes(Recipe_id, process_id) VALUES (5,4),(5,3),(5,6);
INSERT INTO dish_preparing_processes(Recipe_id, process_id) VALUES (6,4),(6,3),(6,6);
