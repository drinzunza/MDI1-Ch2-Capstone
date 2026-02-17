import SwiftUI
import SwiftData

struct CategoriesViews: View {
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Query private var categories: [Category]
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Backgrounds.gradient1.ignoresSafeArea()
                
                List {
                    ForEach(categories) { category in
                        NavigationLink(value:category) {
                            Text(category.name)
                                .foregroundStyle(Color(hex: category.colorHex))
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("My Categories")
                .toolbar {
                    ToolbarItem {
                        Button(action: {}) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
            }
        }  
    }
}

#Preview {
    let cofig = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Task.self, configurations: cofig)
    
    // insert data in container
    let home = Category(name: "Home", colorHex: "#FF0000")
    let work = Category(name: "Work", colorHex: "#023ae0")
    container.mainContext.insert(home)
    container.mainContext.insert(work)
    
    return CategoriesViews()
        .modelContainer(container)
}
