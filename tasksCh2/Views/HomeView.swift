import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tasks: [Task]
    
    @State private var showCategories: Bool = false
    @State private var selectedTask: Task? = nil

    var body: some View {
        NavigationSplitView {
            ZStack {
                
                Backgrounds.gradient1.ignoresSafeArea()
                
                List(tasks, selection: $selectedTask) { task in
                    NavigationLink(value: task) {
                        Text(task.title)
                    }
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
                .navigationDestination(isPresented: $showCategories) {
                    CategoriesViews()
                }
            }
        } detail: {
            if let task = selectedTask {
                TaskDetailsView(task: task)
            }
            else {
                Text("Select an item")
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
    container.mainContext.insert(home)
    container.mainContext.insert(work)
    
    let task1 = Task(title: "Mock Data 1", details: "long description here", budget: 100, category: home)
    let task2 = Task(title: "Mock Data 2", details: "Complete Forum 1 evaluation and set grades", budget: 0, category: work)
    container.mainContext.insert(task1)
    container.mainContext.insert(task2)
    
    
    return HomeView()
        .modelContainer(container)
}
