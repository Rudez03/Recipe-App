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
- I learned how Swift Data is called upon 
- Learned how to build the container for a Swift data model
- 2 models can have a relationship for swift data with one almost like bieng the parent
- learned how to create sample data and preview the sample and any other state in said file. 
- Implementing classes and understanding them.

## Decisions Made
- delete should be handled next rather than edit
- classes rather than structs for swift data.
- sort is not needed at the moment for functionality

## Moved to Future 
- Edit option moved to Sprint 4/5
- Difficulty enum
- Tap gesture for exiting keyboard
- Polishing the keyboard display for most items

## Next Sprint
- Delete
- being able to remove a recipe from the swift data container/memory 

## Reflection 
- This was not as long as Sprint 2, but it was still very important! I learned that in order to create a flow of swift data we need classes not structs, duw to the fact structs are like making copies and classes are more like references to the actual object.I learned after some test cases that a delete is pobably needed before edit. Reasoning beinging. im running test cases on my phone and its saving each case since its doing exactly what it is supposed to do. the issue is that for better testing and flow I should be able to do quick delete on them so I can retry cases...

