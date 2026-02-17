import SwiftUI
import SwiftData

@main
struct tasksCh2App: App {
    
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self, // TO REMOVE
            User.self,
            Category.self,
            Task.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            let context = container.mainContext
            
            // Preload data IF NEEDED
            preloadDataIfNeeded(context)
            
            return container
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ZStack {
                if isLoggedIn {
                    HomeView()
                        .transition(.move(edge: .trailing))
                }
                else {
                    LoginView()
                        .transition(.move(edge: .leading))
                }
            }
        }
        .modelContainer(sharedModelContainer)
    }
    
    @MainActor
    static func preloadDataIfNeeded(_ context: ModelContext) {
        // if database is empty, insert a few records
        
        // MARK: -- if there are no categories, insert some
        let categories = try? context.fetch(FetchDescriptor<Category>())
        guard categories?.isEmpty == true else {
            print("Categories: No seed required")
            return // do nothing
        }
        
        // seed some cats
        let home = Category(name: "Home", colorHex: "#b32741")
        let work = Category(name: "Work", colorHex: "#b36827")
        
        context.insert(home)
        context.insert(work)
        
        
        
        // tasks
        let task1 = Task(title: "Test task 1", details: "long description here", budget: 100, category: home)
        let task2 = Task(title: "Evaluate Forum 1", details: "Complete Forum 1 evaluation and set grades", budget: 0, category: work)
        
        context.insert(task1)
        context.insert(task2)
        
        
        // save changes
        try? context.save()
        print("Data seeded!!")
    }
}









































