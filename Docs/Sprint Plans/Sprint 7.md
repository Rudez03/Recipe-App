# Recipe App — Sprint 7 Plan

## Sprint Theme
**Recipe Scaling/Converting**

Sprint 7 lets a user adjust how much of a recipe they want to make while keeping the saved recipe intact, aswell as converting measurements to desired units

Example:

- Original recipe: **12 servings**, using **2 cups flour**
- Make **24 servings**: display **4 cups flour**
- Reset: return to **12 servings** and **2 cups flour**

---

## Sprint Goal

By the end of Sprint 7, a user can choose a desired serving count in Recipe Detail and see ingredient quantities adjusted to match.

Scaling is temporary. The original servings, ingredient amounts, and recipe instructions remain saved exactly as entered.

---

## Starting Point

The app currently stores:

- `Recipe.servings` as an optional `Int`
- `Ingredient.amount` as a `String`
- Ingredient units separately through `IngredientUnit`
- Ingredient notes separately from amounts

Keeping amounts as text allows family recipes and flexible quantities. This sprint should build on that flexibility rather than require a data migration or stricter ingredient entry.

`IngredientRow` already accepts display text, so Recipe Detail can supply a calculated amount without changing the saved ingredient.

---

## Definition of Done

- [ ] Recipe Detail offers a positive whole-number target serving count when saved servings are greater than zero
- [ ] The scaling factor uses desired servings divided by original servings
- [ ] Whole numbers, decimals, simple fractions, mixed fractions, and common Unicode fractions scale correctly
- [ ] Numeric ranges scale both endpoints
- [ ] Empty, descriptive, and unsupported amounts remain unchanged
- [ ] Unchanged amounts are clearly identified while scaling is active
- [ ] Scaled quantities are readable without long decimal tails
- [ ] The screen clearly shows original servings and the current target
- [ ] Reset restores the original ingredient display
- [ ] Scaling never modifies saved recipe or ingredient data
- [ ] Recipes without valid saved servings still display normally and explain how to enable scaling
- [ ] Leaving Recipe Detail and reopening it starts at the original servings
- [ ] Existing creation, editing, deletion, categories, search, and instructions still work

---

# Sprint Tasks

These are task headings for planning; GitHub issue numbers can be added once issues are created.

## Task 1 — Define Scaling Rules & Serving State

Establish how scaling works before connecting it to the interface.

### Tasks

- Use temporary view state for the desired serving count
- Initialize the target from the saved serving count
- Require original and target servings to be greater than zero
- Calculate the factor with decimal division, avoiding integer division
- Always calculate from the original amount so repeated changes cannot accumulate rounding errors
- Treat the original serving count as an unscaled view and preserve its exact amount text
- Keep scaling unavailable for missing, zero, or negative saved servings; direct the user to Edit Recipe to add valid servings
- Define a reasonable upper limit for the serving control during implementation

**Learning focus:**  
SwiftUI state, optional values, input validation, and separating temporary presentation from persisted data.

---

## Task 2 — Parse & Scale Ingredient Amounts

Create a small calculation helper that interprets supported amount text without modifying the ingredient model.

### Supported Inputs

| Amount | At 2× |
|:---|:---|
| `2` | `4` |
| `0.5` | `1` |
| `1/2` | `1` |
| `1 1/4` | `2 1/2` |
| `½` | `1` |
| `2½` | `5` |
| `2-3` or `2–3` | `4–6` |
| `to taste` | Unchanged |
| Empty amount | Unchanged |

### Tasks

- Trim surrounding whitespace for parsing
- Support whole numbers and dot-separated decimals
- Support slash fractions and mixed fractions
- Support common Unicode fractions, including `¼`, `½`, and `¾`, both alone and attached to whole numbers
- Support ranges whose endpoints use supported numeric formats
- Scale both range endpoints with the same factor
- Reject malformed fractions, zero denominators, negative quantities, and ambiguous text
- Require the entire amount to be understood; do not guess from a numeric prefix
- Return a result that distinguishes a scaled amount from an amount left unchanged
- Preserve unsupported text exactly as entered
- Leave ingredient names, units, and notes unchanged

For example, `1 can` is represented by amount `1` and unit `.can`, so it can scale normally. Text such as `about 2` remains unchanged in this first version.

**Learning focus:**  
String parsing, reusable functions, explicit results, and safe fallback behavior.

---

## Task 3 — Format Readable Scaled Quantities

Turn calculated numbers back into useful cooking amounts.

### Tasks

- Display whole-number results without a decimal suffix
- Prefer common fractions when a result closely matches one
- Display mixed fractions for values such as `2 1/2`
- Use a short decimal for other values; start with a maximum of three decimal places
- Avoid rounding a small positive quantity to a misleading `0`; show additional precision when necessary
- Apply the same formatting rules to both range endpoints
- Keep fractional counts, such as `1/2` of a can or egg, rather than automatically rounding to a whole item
- Keep units unchanged; do not convert tablespoons to cups or grams to kilograms

**Learning focus:**  
Number formatting, rounding, and separating calculation accuracy from display choices.

---

## Task 4 — Add Scaling to Recipe Detail

Connect the serving control and calculated amounts to the existing recipe screen.

### Tasks

- Add a clearly labeled target serving control near the existing servings information
- Show a label such as **Original: 12 servings · Making: 24 servings** when scaling is active
- Supply scaled ingredient display text to `IngredientRow`
- Keep ingredient notes visible
- Mark unsupported amounts as **Not scaled** while scaling is active
- For ingredients without an amount, use **No quantity to scale** rather than inventing one
- Add a Reset action that returns to the original servings
- Explain that instructions and cooking times remain as written
- Keep editing based on the saved recipe values
- After a saved recipe edit, reset scaling to the updated original servings if Recipe Detail remains open
- Start with original servings whenever Recipe Detail is reopened
- Check long names, large text, and smaller screens

**Learning focus:**  
Computed display values, reusable views, and interfaces driven by state.

---

## Task 5 — Test & Finish Sprint 7

### Calculation Checks

- Double, halve, and scale by a non-whole factor, such as 4 servings to 6
- Test every supported input format from Task 2
- Test a mixed-format range, such as `1/2–1`
- Test whitespace, empty text, `to taste`, and unsupported text
- Test malformed input such as `1/0`, `1/`, and `2 apples`
- Test small quantities and decimal rounding
- Change the target repeatedly and verify each result still comes from the original amount
- Add focused automated tests for the parser, calculation, and formatter

### App Checks

- Scale recipes with valid servings
- Open recipes with missing, zero, or negative servings
- Reset and confirm exact original amount text returns
- Navigate away and reopen the recipe
- Relaunch and confirm saved servings and ingredient amounts are unchanged
- Edit a recipe after viewing scaled amounts and verify original values appear in the editor
- Save changed servings and verify the next scaling session uses the new original value
- Cancel edits and verify the saved recipe remains unchanged
- Verify ingredient notes, freeform instructions, and guided steps
- Verify recipe creation, editing, deletion, categories, filtering, and search

### Finish

- Clean up Sprint 7 code
- Review the sprint against its definition of done
- Run final manual checks
- Close Sprint 7 issues once created and completed
- Create the Sprint 7 Wrap-up

---

## Keep Out of Sprint 7

- Saving a scaled copy of a recipe
- Persisting the last selected serving count
- Unit conversions
- Automatic rounding of eggs, cans, or other whole items
- Rewriting amounts inside instructions or guided steps
- Automatically adjusting cooking times
- Shopping List integration
- Make Now integration
- A larger Recipe Detail redesign
- Requiring all ingredient amounts to be numeric

---

## Sprint 7 Success Statement

> I can open a recipe, choose how many servings I want to make, and see useful adjusted ingredient quantities. I can tell which amounts were not scaled, reset to the original, and trust that my saved recipe has not changed.

---

**Get me cooking, not reading.**
