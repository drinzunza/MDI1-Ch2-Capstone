
import SwiftUI
import SwiftData

struct TaskDetailsView: View {
    let task: Task
    
    var body: some View {
        NavigationStack{
            ZStack {
             
                Backgrounds.gradient3.ignoresSafeArea()
                
                VStack {
                    Text("Task Title:")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                    
                    Text(task.title)
                        .font(.headline)
                }
                
            }
            .navigationTitle("Task Details")
        }
        
        
    }
}

#Preview {
    
    let work = Category(name: "Work", colorHex: "#b36827")
    let task1 = Task(title: "Mock Data 1", details: "long description here", budget: 100, category: work)
    
    TaskDetailsView(task: task1)
}
