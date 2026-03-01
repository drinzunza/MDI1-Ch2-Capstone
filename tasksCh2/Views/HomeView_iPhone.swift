
import SwiftUI
import SwiftData


struct HomeView_iPhone: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var allTasks: [Task]
    @Query(sort: [SortDescriptor(\Category.name, order: .forward)]) private var categories: [Category]
    
    @State private var showCategories: Bool = false
    @State private var selectedCategory: Category? = nil
    
    
    private var filteredTasks: [Task] {
        guard let selectedCategory else { return allTasks }
        return allTasks.filter { $0.category == selectedCategory }
    }
    
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                Backgrounds.gradient1.ignoresSafeArea()
                
                VStack {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            
                            // all button
                            Button(action: { selectedCategory = nil }) {
                                CategoryRowView(category: Category(name: "All", colorHex: "#000000"))
                                    .frame(maxWidth: 110)
                            }
                            .opacity(selectedCategory == nil ? 1 : 0.6)
                            .buttonStyle(.plain)
                            
                            // button per category
                            ForEach(categories) { category in
                                Button(action: { selectedCategory = category }) {
                                    CategoryRowView(category: category)
                                        .frame(maxWidth: 110)
                                }
                                .opacity(selectedCategory == category ? 1 : 0.6)
                                .buttonStyle(.plain)
                            }
                            
                            Spacer()
                        }
                        .padding(.vertical, 10)
                    }
                    
                    List(filteredTasks) { task in
                        NavigationLink(){
                            TaskDetailsView(task: task)
                        } label: {
                            TaskRowView(task: task)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets(top:0, leading: 8, bottom: 0, trailing: -14))
                    }
                    .listStyle(.plain)
                    .navigationTitle("My Tasks")
                    .toolbar {
                        ToolbarItem{
                            Button(action: { showCategories = true }) {
                                Text("Cats")
                            }
                        }
                        ToolbarItem {
                            Button(action: {}) {
                                Label("Add Item", systemImage: "plus")
                            }
                        }
                    }
                }
                
            }
            .navigationDestination(isPresented: $showCategories) {
                CategoriesViews()
            }
        }
    }
}

#Preview {
    
    let cofig = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Task.self, configurations: cofig)
    
    // insert data in container
    let home = Category(name: "Home", colorHex: "#b32741")
    let work = Category(name: "Work", colorHex: "#b36827")
    let cat3 = Category(name: "School", colorHex: "#736827")
    let cat4 = Category(name: "Personal", colorHex: "#b31327")
    let cat5 = Category(name: "Stuff", colorHex: "#b36834")
    container.mainContext.insert(home)
    container.mainContext.insert(work)
    container.mainContext.insert(cat3)
    container.mainContext.insert(cat4)
    container.mainContext.insert(cat5)
    
    let task1 = Task(title: "Mock Data 1", details: "long description here", budget: 100, category: home)
    let task2 = Task(title: "Mock Data 2", details: "Complete Forum 1 evaluation and set grades", budget: 0, category: work)
    container.mainContext.insert(task1)
    container.mainContext.insert(task2)
    
    
    return HomeView_iPhone()
        .modelContainer(container)
}
