import mySQL from 'mysql';

const connection = mySQL.createConnection({
  host: 'localhost',
  user: 'hyfuser',
  password: 'hyfpassword',
  database: 'recipes',
});

connection.connect((err) => {
  if (err) throw err;
  console.log(`Connected to DB`);
});

connection.query(
  `
INSERT INTO Categories (Dish_category) VALUES
('Cake'),
('No-Bake'),
('Vegetarian'),
('Vegan'),
('Gluten-Free');
`,
  (err) => {
    if (err) throw err;
    console.log('Data added successfully');
  },
);

connection.query(`
INSERT INTO recipes (recipe) VALUES ('No-Bake Cheesecake'),('Roasted Brussels Sprouts'),('Mac & Cheese');
`);

connection.query(
  `
INSERT INTO ingredients (ingredient) VALUES
("Condensed milk"),
("Cream Cheese"),
("Lemon Juice"),
("Pie Crust"),
("Cherry Jam"),
("Brussels Sprouts"),
("Sesame seeds"),
("Macaroni"),
("Flour"),
("Milk"),
("Shredded Cheddar cheese");
`,
  (err) => {
    if (err) throw err;
    console.log('Data added successfully');
  },
);

connection.query(
  `
INSERT INTO processes (process) VALUES
("Beat Cream Cheese"),
("Add condensed Milk and blend"),
("Add Lemon Juice and blend"),
("Add the mix to the pie crust"),
("Spread the Cherry Jam"),
("Place in refrigerator for 3h."),
("Preheat the oven"),
("Mix the ingredients in a bowl"),
("Spread the mix on baking sheet"),
("Bake for 30'"),
("Cook Macaroni for 8'"),
("Melt butter in a saucepan"),
("Add flour, salt, pepper and mix"),
("Add Milk and mix"),
("Cook until mix is smooth"),
("Add cheddar cheese"),
("Add the macaroni");
`,
  (err) => {
    if (err) throw err;
    console.log('Data added successfully');
  },
);

connection.query(
  `
INSERT INTO recipe_category (Recipe_id, Dish_category_id) VALUES (7,3),(7,4),(7,5),(8,6),(8,7),(9,5);
;
`,
  (err) => {
    if (err) throw err;
    console.log('Data added successfully');
  },
);

connection.query(
  `
INSERT INTO Recipe_ingredients (Recipe_id, ingredient_id) VALUES (7,38),(7,39),(7,40),(7,41),(7,42),(8,43),(8,40),(8,44),(8,7),(8,9),(8,14),(9,34),(9,23),(9,46),(9,9),(9,7),(9,47),(9,48);
;
`,
  (err) => {
    if (err) throw err;
    console.log('Data added successfully');
  },
);

connection.query(
  `
INSERT INTO dish_preparing_processes (Recipe_id, process_id) VALUES (7,7),(7,8),(7,9),(7,10),(7,11),(7,12),(8,13),(8,14),(8,15),(8,16),(9,17),(9,18),(9,19),(9,20),(9,21),(9,22),(9,23);
`,
  (err) => {
    if (err) throw err;
    console.log('Data added successfully');
  },
);

connection.end();
