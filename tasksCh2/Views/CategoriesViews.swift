import SwiftUI
import SwiftData

struct CategoriesViews: View {
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Query private var categories: [Category]
    
    @State private var showCategorySheet: Bool = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Backgrounds.gradient1.ignoresSafeArea()
                
                List {
                    ForEach(categories) { category in
                        NavigationLink(value:category) {
                            CategoryRowView(category:category)
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("My Categories")
                .toolbar {
                    ToolbarItem {
                        Button(action: { showCategorySheet = true }) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
            } // ztack
            .sheet(isPresented: $showCategorySheet) {
                CategoryView()
            }
        }// nav stack
    } // body end
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
