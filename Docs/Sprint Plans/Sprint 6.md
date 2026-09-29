# Recipe App — Sprint 6 Plan

## Sprint Theme
**Categories & Recipe Organization**

Sprint 6 focuses on making the Recipe Book easier to organize and browse as the number of saved recipes grows.

The two main ideas are:

- Recipes are always organized **A–Z**
- **Categories** can be used to filter which recipes are shown

---

## Sprint Goal

By the end of Sprint 6, recipes should be able to belong to one or more categories.

The Recipe Book should automatically display recipes alphabetically and allow the user to filter the book by category while keeping the results in alphabetical order.

---

## Why This Sprint Comes Next

The Recipe App can now store the major pieces of a recipe:

- Recipe information
- Ingredients
- Instructions
- Guided steps

As more recipes are added, the next problem becomes **organization**.

Sprint 6 begins solving that problem without introducing the larger Boards system yet.

A **Category** describes what a recipe is.

Examples:

- Breakfast
- Dinner
- Dessert
- Baking
- Mexican
- Drinks

A **Board** will eventually describe how the user personally wants to collect recipes.

Examples:

- Christmas Dinner
- Recipes to Try
- Panadería Alemán
- Mom's Favorites

Boards will come later.

---

## Definition of Done

Sprint 6 is complete when:

- [ ] Recipes can have optional categories
- [ ] A recipe can belong to more than one category
- [ ] Categories persist using SwiftData
- [ ] Categories can be assigned when creating a recipe
- [ ] Categories can be changed when editing a recipe
- [ ] The Recipe Book automatically displays recipes A–Z
- [ ] The Recipe Book can be filtered by category
- [ ] Filtered recipes remain A–Z
- [ ] Search works alongside category filtering
- [ ] Recipes without categories still work normally
- [ ] Existing Recipe App features still work correctly

---

# Sprint Tasks

## Issue #29 — Build Category Data Model

Create the foundation for categories and determine how they connect to recipes.

### Tasks

- Create the Category model
- Establish the relationship between Recipe and Category
- Allow recipes to have multiple categories
- Keep categories optional
- Persist categories with SwiftData
- Make sure existing recipes can remain uncategorized

**Learning focus:**  
SwiftData relationships and designing how two models connect.

---

## Issue #30 — Assign Categories When Creating a Recipe

Extend the existing New Recipe flow so categories can be selected before saving.

### Tasks

- Add category information to DraftRecipe
- Select one or more categories
- Keep category selection optional
- Convert the draft category selection into the saved Recipe
- Make sure categories persist correctly

**Learning focus:**  
Extending the DraftRecipe → Recipe conversion pattern.

---

## Issue #31 — Edit Recipe Categories

Allow an existing recipe's categories to be changed through the Edit Recipe flow.

### Tasks

- Load saved categories into DraftRecipe
- Add categories while editing
- Remove categories while editing
- Save category changes
- Make sure Cancel leaves the original Recipe unchanged

**Learning focus:**  
Continuing the draft editing pattern while working with relationships.

---

## Issue #32 — Category Filtering & A–Z Recipe Book

Organize the Recipe Book alphabetically and allow categories to filter which recipes are displayed.

### A–Z Organization

Recipes should automatically appear alphabetically by recipe name.

A–Z will be the **standard Recipe Book order** for now rather than a user-selected sorting option.

### Category Filtering

Selecting a category should only show recipes belonging to that category.

Example:

```text
All Recipes
↓
Apple Pie
Brownies
Conchas
Pozole
Tres Leches
```

Selecting:

```text
Dessert
```

could display:

```text
Apple Pie
Brownies
Conchas
Tres Leches
```

The filtered recipes should still remain A–Z.

Search should also continue working with the category filter.

**Learning focus:**  
Filtering and sorting collections while keeping SwiftUI views driven by data.

---

## Issue #33 — Test & Finish Sprint 6

Test the complete category and organization system before closing the sprint.

### Test

- Recipes with no categories
- Recipes with one category
- Recipes with multiple categories
- Creating recipes with categories
- Editing categories
- Removing categories
- Canceling edits
- Category persistence after relaunch
- A–Z Recipe Book ordering
- Category filtering
- Search + category filtering
- Uncategorized recipes
- Existing ingredients and instructions
- Recipe creation, editing, and deletion

### Finish

- Clean up Sprint 6 code
- Review the repository
- Run final manual stress tests
- Close remaining Sprint 6 issues
- Create the Sprint 6 Wrap-up

---

## Keep Out of Sprint 6

To keep this sprint focused:

- Boards
- Favorites
- Shopping List
- Make Now
- Custom sorting controls
- Z–A sorting
- Recently Added sorting

Those features can build on the organization system later.

For Sprint 6:

> **A–Z is the standard order. Categories are the filter.**

---

## Sprint 6 Success Statement

> I can save recipes with categories, open my Recipe Book and automatically see everything organized A–Z, then choose a category to narrow the book while keeping my recipes organized and searchable.

---

**Get me cooking, not reading.**
