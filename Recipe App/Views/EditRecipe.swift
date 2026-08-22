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
    @Environment(\.modelContext) private var modelContext
    @State private var draft: DraftRecipe
    
    // MARK: - Keyboard
    @FocusState private var isFocused: Bool
    
    // MARK: - Draft Init
    init(recipe: Recipe, onDelete: @escaping () -> Void) {
        self.recipe = recipe
        _draft = .init(initialValue: DraftRecipe(from: recipe))
        self.onDelete = onDelete
    }
    
    let recipe: Recipe
    var onDelete: () -> Void
	
	
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                // MARK: - Name
                TextField("Recipe Name", text: $draft.name, axis: .vertical)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 20)
                    .padding(.bottom, 5)
                    .focused($isFocused)
                    .submitLabel(.done)
                    .onSubmit {
                        isFocused = false
                    }
                
                HStack{
                    
                    // MARK: hrs
                    Image(systemName: "clock")
                        //.padding(.leading)
                    
                    Picker("Hours", selection: $draft.hours) {
                        ForEach(0...24, id: \.self) { hr in
                            Text("\(hr) hrs")
                                .tag(hr)
                        }
                    }
                    .pickerStyle(.menu)
                    .fixedSize(horizontal: true, vertical: false)
                    
                    // MARK: Mins
                    Picker("Mins", selection: $draft.mins) {
                        ForEach(Array(stride(from: 0, through: 55, by: 5)), id: \.self) { min in
                            Text("\(min) mins")
                                .tag(min)
                        }
                    }
                    .pickerStyle(.menu)
                    .fixedSize(horizontal: true, vertical: false)
                    .padding(.trailing)
                    
                    Spacer()
                    
                    // MARK: - Servings
                    Image(systemName: "person.crop.circle")
                    Picker("serving size", selection: $draft.servings) {
                        Text("Not Set")
                            .tag(nil as Int?)
                        
                        ForEach( 1...20, id: \.self) { number in
                            Text("\(number) servings")
                                .tag(Optional(number))
                            
                        }
                    }
                    
                }
                .pickerStyle(.menu)
                .padding(.bottom)
                
                // MARK: - Description
                TextField("Add Descripton", text: $draft.descrip, axis: .vertical)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                    .focused($isFocused)
                    .submitLabel(.done)
                    .onSubmit {
                        isFocused = false
                    }
                
               
                
                Spacer()
                
                // MARK: - Delete action
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
                        modelContext.delete(recipe)
                        onDelete()
                    }
                    
                    Button("Cancel", role: .cancel){
                        
                    }
                }
                
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        //MARK: - Save/Cancel actions
		.toolbar {
			ToolbarItem(placement: .confirmationAction) {
				Button("Save"){
					dismiss()
				}
			}
		}
    }
	
}

#Preview {
	NavigationStack{
        EditRecipe(recipe: SampleData.shared.sampleRecipe){
            
        }
            .modelContainer(SampleData.shared.modelContainer)
	}
}
