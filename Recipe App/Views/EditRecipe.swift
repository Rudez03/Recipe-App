//
//  EditRecipe.swift
//  Recipe App
//
//  Created by Rudy Serrato III on 8/19/26.
//

import SwiftUI
import SwiftData

struct EditRecipe: View {
	@State private var showAlert: Bool = false
	@Environment(\.dismiss) private var dismiss
    let recipe: Recipe
	
	
    var body: some View {
		VStack {
            Text(recipe.name)
                .font(.title)
                .padding(.bottom)
                .fontWeight(.semibold)
            
            Text(recipe.descrip)
                .padding(.leading)
                .padding(.trailing)
            
            Spacer()
			Button(role: .destructive, action: {
				showAlert.toggle()

			}) {
				Text("Delete Reicpe")
					//.font(.title2)
					.padding()
					.overlay {
						Capsule()
							.stroke(.red)
					}

			}
			.confirmationDialog("Are you sure?", isPresented: $showAlert, titleVisibility: .visible) {
				Button("yes, delete", role: .destructive){
					
				}
				
				Button("Cancel", role: .cancel){
					
				}
			}

		}
		.toolbar {
			ToolbarItem(placement: .confirmationAction) {
				Button("Save"){
					dismiss()
				}
			}
			ToolbarItem(placement: .cancellationAction) {
				Button("Cancel"){
					dismiss()
				}
			}
		}
    }
	
}

#Preview {
	NavigationStack{
        EditRecipe(recipe: SampleData.shared.sampleRecipe)
            .modelContainer(SampleData.shared.modelContainer)
	}
}
