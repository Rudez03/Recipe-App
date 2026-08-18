# Recipe App — Sprint 4: Recipe Management

## Sprint Goal

A user can confidently manage recipes they have already saved.

Sprint 4 builds directly on the SwiftData persistence completed in Sprint 3.

The first priority is **deleting recipes**. Once deletion is complete and tested, we will evaluate the scope of **editing recipes** before continuing.

---

## Sprint Tasks

### Issue 1 — Add Delete Action & Confirmation

- Decide where Delete should live in the existing recipe UI.
- Add a clear destructive Delete action.
- Ask for confirmation before permanently deleting a recipe.
- Allow the user to cancel without changing anything.

**Learning focus:** destructive actions, confirmation UI, and designing around irreversible actions.

---

### Issue 2 — Connect Delete to SwiftData

- Delete the selected `Recipe` through `ModelContext`.
- Make sure the Recipe Book updates after deletion.
- Verify the correct recipe is removed.
- Confirm the Recipe/Ingredient relationship behaves correctly.
- Confirm deletion persists after relaunch.

**Learning focus:** deleting persistent SwiftData models and understanding relationship/delete behavior.

---

### Issue 3 — Test & Finish Delete

Test the complete delete lifecycle:

**Create → Save → Relaunch → View → Delete → Relaunch → Confirm Gone**

Also test:

- Recipes with and without ingredients.
- Canceling a deletion.
- Deleting one recipe while several exist.
- Deleting the final recipe and returning to the empty state.
- Making sure other recipes remain untouched.
- Existing Create, Search, and Recipe Detail functionality.

### 🗑️ Delete Milestone

At this point, deleting recipes should be complete and reliable.

Before continuing, evaluate the scope of Edit Recipe.

> If editing has become large enough to deserve its own sprint, Sprint 4 can end here and Edit moves to Sprint 5.

---

### Issue 4 — Build Edit Recipe Flow

If Edit remains within Sprint 4:

- Add a way to enter Edit from an existing recipe.
- Load the recipe's existing information into the editor.
- Determine how much of the existing `NewRecipe` flow can be reused.
- Allow the recipe's main details to be changed.

**Learning focus:** working with existing SwiftData models, passing existing data into views, and reusing UI without unnecessary duplication.

---

### Issue 5 — Edit Ingredients

- Load the recipe's existing ingredients.
- Edit an existing ingredient.
- Add new ingredients.
- Remove ingredients.
- Preserve ingredients that were not changed.

**Learning focus:** modifying related SwiftData models and managing collections of persistent data.

---

### Issue 6 — Handle Save & Cancel

- Save changes to the existing `Recipe`.
- Make sure editing does not create a duplicate recipe.
- Make sure Cancel leaves the original recipe unchanged.
- Handle temporary ingredient changes safely.
- Confirm saved edits persist after relaunch.

**Learning focus:** temporary editing state vs. persistent state and safely updating existing models.

---

### Issue 7 — Test & Finish Edit

Test:

- Editing only one recipe field.
- Editing several fields.
- Editing all available fields.
- Adding, changing, and removing ingredients.
- Canceling after making changes.
- Editing and saving the same recipe multiple times.
- Edit → Save → Relaunch.
- Confirming no duplicate recipes are created.
- Existing Create, Search, Delete, and Recipe Detail functionality.

### ✏️ Edit Milestone

If Edit is completed successfully:

**Create → Save → View → Edit → Save → Delete**

The Recipe App now supports the core management lifecycle for persistent recipes.

---

## Keep Out of Sprint 4

- Alphabetical sorting
- Recipe scaling
- Categories
- Shopping List
- Favorites
- Make Now
- Boards
- Profile
- Photos
- Major visual redesigns

If something outside the sprint becomes necessary for Delete or Edit to work correctly, evaluate it before expanding scope.

---

## Definition of Done

### Required

> A user can safely delete a saved recipe, and that deletion persists after the app relaunches.

### If Edit Remains in Sprint 4

> A user can create, view, edit, and delete persistent recipes without losing or duplicating data.

---

## Sprint Principle

> **Make it work. Make it clean. Keep it simple.**
