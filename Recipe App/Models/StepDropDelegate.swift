//
//  StepDropDelegate.swift
//  Recipe App
//
//  Created by Rudy Serrato III on 9/14/26.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static let recipeStep = UTType(
        exportedAs: "Serrato.Recipe-App.recipestep"
    )
}

struct StepDropDelegate: DropDelegate {
    
    @Binding var steps: [DraftRecipeStep]
    @Binding var draggedStepID: UUID?
    var targetStepID: UUID
    
    func performDrop(info: DropInfo) -> Bool {
		draggedStepID = nil
        return true
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
    func dropEntered(info: DropInfo) {
        
        guard let fromIndex = steps.firstIndex(where: { step in
            step.id == draggedStepID
        }) else {
           return
        }
        
        guard let toIndex = steps.firstIndex(where: { step in
            step.id == targetStepID
        }) else {
            return
        }
        
        let destination = toIndex > fromIndex ? toIndex + 1 : toIndex
        
        if fromIndex != toIndex {
            withAnimation {
                
                steps.move (
                    fromOffsets: IndexSet(integer: fromIndex),
                    toOffset: destination
                )
                
                for (index, _) in steps.enumerated() {
                    steps[index].step = index
                }
            }
        }
    }
    
}

