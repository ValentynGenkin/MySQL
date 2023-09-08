# Prep exercise week 4

As a preparation step for the upcoming Q&A, you need to work on the following exercise, which is based on the prep
exercise of the previous week.

## Exercise

Last week you updated your database to be normalized. Now that you have some more NoSQL knowledge, convert your database
to a document-based database. Think about the following:

- What are the collections?
- What information will you embed in a document and which will you store normalised?

## Discussion (Try to write answers to these questions in text, provide queries and commands when necessary)

- What made you decide when to embed information? What assumptions did you make?
- If you were given MySQL and MongoDB as choices to build the recipe's database at the beginning, which one would you
  choose and why?

I chose the Embedded method for storage data. I made this decision because the recipes will not change in the future and using tags inside the document gives me options for fast searches and easy way for scale. In the process of database growing I can implement Indexes for more fast queries.In this case I chose performance and minimum queries for fetch data sacrificing data repetition.

Recipe document example:

```
{
recipe_title: 'bolognese',  
  tags: ['pasta', 'gluten', 'meat'],  
  ingredients: [  
      'spaghetti',  
      'chopped meat',  
      'onion',  
      'carrot',  
      'celery',  
      'tomato',  
      'tomato sauce',  
      'salt',  
      'black paper',  
      'white paper',  
      'parmesan',  
    ],  
  preparing: ['boil', 'slice', 'stew'],  
};
```

I choose MongoDB, in my opinion this is the easiest way for storage this type of data - recipes.
