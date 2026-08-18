# Sprint 3 Wrap-Up

## Sprint Goal
A user can save a recipe, completely close the app, reopen it, and still find and open that recipe in the Recipe Book.

## Completed
- Prepare models for SwiftData
- Set up the SwiftData container
- Load saved recipes in RecipeBook
- Save new recipes to SwiftData
- Handle sample recipes without duplicates
- Test and polish recipe persistence

## Lessons Learned
- I learned how views access SwiftData through the model container, model context, and queries.
- Learned how to build the container for a SwiftData model.
- Two models can have a relationship in SwiftData, with one almost like being the parent.
- Learned how to create sample data and preview both populated and empty states.
- Implementing classes and understanding them.
- SwiftData models use classes so SwiftData can track the identity and changes of the same object.

## Decisions Made
- Delete should be handled next rather than edit.
- Sort is not needed at the moment for functionality.

## Moved to Future
- Edit option moved to Sprint 4/5
- Difficulty enum
- Tap gesture for exiting the keyboard
- Polishing the keyboard display for most items

## Next Sprint
- Delete
- Being able to remove a recipe from the SwiftData container/memory

## Reflection
This was not as long as Sprint 2, but it was still very important! I learned that in order to create a flow of SwiftData, we need classes rather than structs because structs are like making copies and classes are more like references to the actual object. I learned after running some test cases that delete is probably needed before edit. I was running test cases on my phone, and it saved each case because it was doing exactly what it was supposed to do. The issue is that for better testing and flow, I should be able to quickly delete them so I can retry cases.
