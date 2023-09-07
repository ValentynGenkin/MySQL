import { MongoClient } from 'mongodb';
import dotenv from 'dotenv';

import { recipes } from './recipeData.js';

dotenv.config();

const client = new MongoClient(process.env.MONGODB_URL);

const DB = 'Prep_week4';
const collection = 'recipes';

const checkConnection = async () => {
  await client.connect();

  console.log('Connected to DB');
};

const dropCollectionIfExistAndCreateNew = async (client, DB, collection) => {
  const hasCollection = await client.db(DB).listCollections().toArray();

  const result = hasCollection.find((res) => res.name === collection);

  if (result) {
    await client.db(DB).collection(collection).drop();

    console.log(
      `Collection '${collection}' deleted before testing sample data`,
    );
  }

  await client.db(DB).createCollection(collection);

  console.log(`Collection '${collection}' created`);
};

const addRecipeToDB = async (client, DB, collection) => {
  const result = await client.db(DB).collection(collection).insertMany(recipes);

  console.log(result.insertedCount);
};

const findRecipe = async (client, recipe) => {
  const result = await client
    .db(DB)
    .collection(collection)
    .findOne({ recipe_title: recipe }, { projection: { _id: 0, tags: 0 } });

  console.log(result);
};
const recipesByTag = async (client, [...tags]) => {
  const result = await client
    .db(DB)
    .collection(collection)
    .find({ tags: { $all: tags } })
    .toArray();

  console.log(result.map((recipe) => recipe.recipe_title));
};

const main = async (client, DB, collection) => {
  try {
    await checkConnection();

    await dropCollectionIfExistAndCreateNew(client, DB, collection);

    await addRecipeToDB(client, DB, collection);

    await findRecipe(client, 'carbonara');

    await recipesByTag(client, ['pasta', 'meat']);
  } catch (e) {
    console.error(e);
  } finally {
    client.close();
  }
};

main(client, DB, collection);
