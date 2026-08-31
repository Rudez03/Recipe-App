# 🍳 Recipe App Roadmap

> **Get me cooking, not reading.**

This roadmap outlines the current direction of the Recipe App.

It is intentionally flexible. Features may move, change, expand, or be removed as the app develops and new ideas are tested.

The goal is to build the app in layers:

**Make it work. Make it clean. Keep it simple.**

---

## 🧱 Foundation — Sprints 1–4

Before expanding the app, the first four sprints established the core recipe system.

### Sprint 1 — View Recipes ✅
**Goal:** A user can confidently view a recipe without feeling overwhelmed.

- Recipe Book
- Recipe cards
- Recipe Detail
- Ingredients
- Search
- Empty states

### Sprint 2 — Create Recipes ✅
**Goal:** A user can create their own recipe and ingredients.

- New Recipe
- Recipe information
- Serving and time inputs
- Ingredient Editor
- Ingredient validation

### Sprint 3 — Persistence ✅
**Goal:** Recipes survive beyond the current app session.

- SwiftData
- Persistent recipes
- Persistent ingredients
- Model relationships
- Preview/sample data

### Sprint 4 — Edit & Delete ✅
**Goal:** A saved recipe can continue changing after it is created.

- Edit Recipe
- Edit ingredients
- Add/remove ingredients
- Draft editing system
- Save changes
- Delete Recipe
- Delete confirmation

---

# 🚀 Next Phase

With the basic recipe lifecycle working, development can shift toward making the app more useful for actually **organizing, preparing, and cooking recipes.**

---

## 📝 Sprint 5 — Instructions

### Goal
> A user can record recipe instructions in whatever level of structure makes sense for their recipe.

Recipes should not be forced into one format.

A family recipe might simply say:

> Mix everything together, put it in the oven, and bake until it's done.

Another recipe might benefit from detailed step-by-step instructions.

Both should belong in the app.

### Direction

- Freeform recipe instructions
- Optional guided recipe steps
- Add steps
- Edit steps
- Delete steps
- Reorder steps
- Guided steps are **never required**

### Future Possibilities

Individual steps may eventually support:

- Linked ingredients
- Optional timers
- Notes or tips
- Make Now integration

These do not all need to be implemented during Sprint 5.

---

## 🗂️ Sprint 6 — Categories & Organization

### Goal
> A user can organize their Recipe Book and quickly narrow it down to the recipes they want.

As the Recipe Book grows, search alone will not be enough.

### Direction

- Recipe categories
- Assign categories while creating/editing
- Filter Recipe Book by category
- Sorting options
- Search and filters working together

### Questions to Explore

- Can a recipe have one category or multiple?
- Which categories should be built in?
- Can users create their own categories?

### Not Yet

**Boards and Collections are separate from categories.**

Categories organize recipe data.

Boards will eventually provide a more personal way to collect recipes.

---

## ⚖️ Sprint 7 — Recipe Scaling

### Goal
> A user can adjust how much of a recipe they want to make without changing the original recipe.

Example:

**Original Recipe — 12 cupcakes**

`2 cups flour`

Scale to **24 cupcakes:**

`4 cups flour`

### Direction

- Select desired serving amount
- Calculate scaling factor
- Scale ingredient quantities
- Preserve the original recipe
- Clearly distinguish scaled values from saved values

### Challenges to Explore

Ingredient amounts are not always simple numbers.

Examples:

- `1/2 cup`
- `1 1/4 cups`
- `2–3 tbsp`
- `1 can`
- `to taste`

Scaling should remain useful without forcing every ingredient into an overly rigid format.

---

## ❤️ Sprint 8 — Favorites & Quick Access

### Goal
> A user can quickly return to the recipes that matter most to them.

The recipes someone cooks constantly should require almost no searching.

### Direction

- Favorite/unfavorite recipes
- Favorites filter or section
- Persistent favorite status
- Quick access from the Recipe Book

### Possible Expansion

Later versions could explore:

- Recently viewed
- Recently cooked
- Frequently cooked

The first version should stay simple.

---

## 🛒 Sprint 9 — Shopping List

### Goal
> A user can move from choosing a recipe to knowing what they need to buy.

### Direction

- Send recipe ingredients to a Shopping List
- Select which ingredients to add
- Manually add shopping items
- Check items off
- Delete items
- Persistent shopping list

### Future Possibilities

- Combine duplicate ingredients
- Grocery categories
- Multiple shopping lists
- Add ingredients from multiple recipes
- Automatically account for scaled recipes

---

## 🍳 Sprint 10 — Make Now

### Goal
> A user can stop reading the entire recipe and focus only on what they need to do right now.

Make Now transforms optional guided instructions into a focused cooking experience.

### Concept

Instead of displaying the entire recipe at once:

**Step 3 of 8**

> Add the onions and garlic to the pan.

**Ingredients**

- ½ onion
- 2 cloves garlic

**Timer**

5 minutes

**← Previous** | **Next →**

### Direction

- Start Make Now from Recipe Detail
- Display one instruction at a time
- Navigate forward/backward
- Show current progress
- Integrate structured recipe steps

### Future Possibilities

- Step-specific ingredients
- Built-in timers
- Multiple active timers
- Keep screen awake while cooking
- Cooking progress
- Resume an unfinished cooking session

### Core Rule

**Make Now is optional.**

A recipe does not need guided instructions to be considered complete.

Freeform family recipes should remain first-class recipes within the app.

---

# 🔮 Beyond Sprint 10

These features are intentionally farther out and will be planned when the core cooking experience is stronger.

## 📌 Boards & Collections

Create personal groups of recipes such as:

- Fall Baking
- Family Recipes
- Weeknight Dinner
- Desserts
- Recipes to Try
- Holiday Baking

Unlike categories, Boards are personal collections rather than recipe metadata.

---

## 🎨 Recipe Book Redesign

The current UI exists primarily to establish functionality.

Once the major systems are working, the app can receive a larger visual redesign centered around its identity as a **digital recipe book**.

Possible areas include:

- Recipe-book-inspired layouts
- Recipe imagery
- Improved Recipe Cards
- Typography
- Warm colors and materials
- Navigation redesign
- Animations and transitions
- More intentional spacing and hierarchy

The redesign should improve an already-working app rather than determine how the app works.

---

# 🧭 Development Philosophy

The roadmap should guide development — **not control it.**

After every sprint:

1. Build the feature.
2. Test it.
3. Clean it up.
4. Review the app as a whole.
5. Decide whether the roadmap still makes sense.

Features can move.

Features can change.

Features can be removed.

New ideas can be added.

But every feature should answer one question:

> **Does this help someone get from their recipe to actually cooking?**

---

## Current Progress

| Sprint | Focus | Status |
|:---:|---|:---:|
| 1 | View Recipes | ✅ Complete |
| 2 | Create Recipes | ✅ Complete |
| 3 | Persistence | ✅ Complete |
| 4 | Edit & Delete | ✅ Complete |
| 5 | Instructions | 🔜 Next |
| 6 | Categories & Organization | 📋 Planned |
| 7 | Recipe Scaling | 📋 Planned |
| 8 | Favorites & Quick Access | 📋 Planned |
| 9 | Shopping List | 📋 Planned |
| 10 | Make Now | 📋 Planned |

---

*This roadmap is a living document and will evolve alongside the Recipe App.*
