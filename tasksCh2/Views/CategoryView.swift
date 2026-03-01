import SwiftUI
import SwiftData

struct CategoryView: View {
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Environment(\.dismiss) private var dismiss
         
    @State private var categoryName: String = ""
    @State private var selectedColor: Color = .orange
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Backgrounds.gradient2.ignoresSafeArea()
                
                Form {
                    
                    Section(header: Text("Category Details").foregroundStyle(Color(hex: "#333"))) {
                        TextField("Category Name", text: $categoryName)
                    }
                    
                    Section(header: Text("Category Color").foregroundStyle(Color(hex: "#333"))) {
                        ColorPicker(selection:$selectedColor) {
                            Text("Select a color for your category!")
                                .foregroundStyle(.black)
                                .padding()
                                .background(selectedColor)
                        }
                    }
                    
                    Section {
                        Button(action: saveCategory)
                        {
                            HStack{
                                Spacer()
                                Text("Save Category")
                                Spacer()
                            }
                        }
                    }
                } // form ends
                .scrollContentBackground(.hidden)
                .padding(.top,30)
                
            } // ztack ends
            .navigationTitle("Create Category")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            
        }// nav stack ends
        
    }// body end
    
    func saveCategory() {
        let newCategory = Category(name: categoryName, colorHex: selectedColor.toHex())
        
        modelContext.insert(newCategory)
        
        do {
            try modelContext.save()
            dismiss()
            // todo: show a tost or success alert
        }
        catch {
            print("Save category failed: \(error)" )
        }
    }
}

#Preview {
    CategoryView()
}
