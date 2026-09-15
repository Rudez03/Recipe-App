//
//  StepDropDelegate.swift
//  Recipe App
//
//  Created by Rudy Serrato III on 9/14/26.
//

import Foundation
import SwiftUI

struct StepDropDelegate: DropDelegate {
    
    @Binding var steps: [DraftRecipeStep]
    @Binding var draggedStepID: UUID?
    var targetStepID: UUID
    
    func performDrop(info: DropInfo) -> Bool {
        return true
    }
    
    

    
}

