//
//  RecipeStepRow.swift
//  Recipe App
//
//  Created by Chacho on 9/20/26.
//

import SwiftUI
import UniformTypeIdentifiers


enum FocusedStepField : Hashable {
    case stepName(UUID)
    case stepDetails(UUID)
}

struct RecipeStepRow: View {
    @Binding var draftStep: DraftRecipeStep
    @Binding var draggedStepID: UUID?
    @FocusState.Binding var focusedStep: FocusedStepField?
    
    var onDelete: () -> Void
    var onRequestScroll: () -> Void
    
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "line.3.horizontal")
				.frame(width: 50, height: 50)
                .contentShape(Capsule())
                .onDrag {
                    draggedStepID = draftStep.id
                    let provider = NSItemProvider()

                    provider.registerDataRepresentation(
                        forTypeIdentifier: UTType.recipeStep.identifier,
                        visibility: .ownProcess
                    ) { completion in
                        completion(Data(), nil)
                        return nil
                    }

                    return provider
                }preview: {
					Image(systemName: "line.3.horizontal")
				}
				.padding(.top,38)
			
            VStack {
                Text("Step \(draftStep.step + 1) ")
                    .fontWeight(.bold)
                
                TextField("Step Name", text: $draftStep.name)
                    .focused($focusedStep, equals: .stepName(draftStep.id))
                    .submitLabel(.next)
                    .onSubmit {
                        focusedStep = .stepDetails(draftStep.id)
                    }
                
                TextField ("Step Details", text: $draftStep.details, axis: .vertical)
                    .focused($focusedStep, equals: .stepDetails(draftStep.id))
                    .submitLabel(.done)
                    .onChange(of: draftStep.details) { oldValue, newValue in
                        if newValue.contains("\n") {
                            draftStep.details = newValue.replacingOccurrences(of: "\n", with: "")
                            focusedStep = nil
                            return
                        }
                        
                        if focusedStep == .stepDetails(draftStep.id) {
                            onRequestScroll()
                        }
                    }
            }
            .id(draftStep.id)
            
            Button(role: .destructive) {
                onDelete()
            } label: {
                Image(systemName: "minus.circle.fill")
                    .foregroundStyle(.red)
            }
            
        }
       // .opacity(draggedStepID == draftStep.id ? 0.15 : 1)
    }
}


struct RecipeStepRowPreview: View {
    @State private var draftStep = DraftRecipeStep(
        name: "Mix Wet Ingredients",
        details: "Beat the butter and sugar until fluffy.",
        step: 0
    )

    @State private var draggedStepID: UUID?
    
    @FocusState private var focusedStep: FocusedStepField?
    
    var body: some View {
        RecipeStepRow(
            draftStep: $draftStep,
            draggedStepID: $draggedStepID,
            focusedStep: $focusedStep,
            onDelete: {},
            onRequestScroll: {}
            
        )
    }
}
    
#Preview {
    RecipeStepRowPreview()
}
