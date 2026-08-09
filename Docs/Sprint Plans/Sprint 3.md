# Sprint 3 — Persistent Recipes

## Sprint Goal
A user can save a recipe, completely close the app, reopen it, and still find and open that recipe in the Recipe Book.

## Why This Sprint Matters
Sprint 2 created a complete recipe-entry flow, but recipes currently exist only while the app is running.

Sprint 3 will make the Recipe Book trustworthy by giving recipes a permanent home. This also creates the foundation for future features such as editing, deleting, favorites, boards, and shopping lists.

## Core Technology
This sprint will introduce **SwiftData**, Apple’s framework for storing and retrieving persistent app data.

## Sprint Tasks

### 1. Prepare Models for Persistence
Update the following models so SwiftData can store them:

- Recipe
- Ingredient
- IngredientUnit

Preserve their current behavior and relationships.

### 2. Create the SwiftData Container
Set up the app’s persistent data container and make it available throughout the necessary views.

### 3. Load Saved Recipes
Replace the temporary recipe array in `RecipeBook` with recipes fetched from persistent storage.

Confirm that:

- Saved recipes appear in the Recipe Book.
- Search continues to work.
- Recipe navigation continues to work.

### 4. Save New Recipes
Update the Sprint 2 Save flow so a completed recipe is inserted into SwiftData.

The user should return to the Recipe Book and see the newly saved recipe.

### 5. Handle Sample Recipes
Create a clear system for development sample recipes.

Sample recipes should:

- Remain available for development and previews.
- Not duplicate every time the app launches.
- Not interfere with testing real saved recipes.

### 6. Test and Polish Persistence
Test the full save-and-reload experience with different kinds of recipes.

## Definition of Done
Sprint 3 is complete when:

- [ ] A recipe can be saved with only a name.
- [ ] A recipe can be saved with complete information.
- [ ] Unfinished recipe ideas can be saved.
- [ ] Ingredients persist with their recipe.
- [ ] Saved recipes appear in the Recipe Book.
- [ ] Recipes remain after completely closing and reopening the app.
- [ ] Search works with saved recipes.
- [ ] Saved recipes can still be opened in `RecipeDetail`.
- [ ] Sample recipes do not duplicate unexpectedly.
- [ ] The complete flow passes physical testing on an iPhone.

## Stress Tests

Before completing the sprint, test the following:

1. Save a recipe containing only a name.
2. Save a recipe with time, servings, description, and multiple ingredients.
3. Save multiple recipes consecutively.
4. Completely close and reopen the app.
5. Search for a saved recipe.
6. Open a saved recipe and confirm all its information appears correctly.
7. Relaunch the app multiple times and confirm that sample recipes do not duplicate.

## Out of Scope

The following features are intentionally excluded from Sprint 3:

- Editing recipes
- Deleting recipes
- Difficulty
- Favorites
- Boards
- Shopping lists
- Major visual redesigns

These features will be handled in future sprints.

## Sprint Reminder

> Every feature must earn its place.

The purpose of this sprint is persistence—not expanding the recipe editor or introducing unrelated features.

## Expected User Experience

By the end of Sprint 3, a user should be able to create a recipe and trust that it will still be waiting for them the next time they open the app.

> Get me cooking, not reading.
