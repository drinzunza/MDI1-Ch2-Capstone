
import SwiftUI
import SwiftData

struct TaskDetailsView: View {
    @Environment(\.modelContext) private var modelContext: ModelContext
    let task: Task
    
    var body: some View {
        NavigationStack{
            ZStack {
             
                if task.done {
                    Backgrounds.gradientCompleted.opacity(0.9).ignoresSafeArea()
                }
                else {
                    Backgrounds.gradient3.opacity(0.9).ignoresSafeArea()
                }
                
                VStack(alignment:.leading) {

                    Text(task.title)
                        .font(.title)
                        .bold()
                        .foregroundStyle(Color(hex: "#222"))
                    
                    
                    Text(task.createdAt, format: .dateTime)
                        .font(.subheadline)
                        .foregroundStyle(Color(hex: "#222"))
                        .fontWeight(.thin)
                    
                    
                    HStack {
                        Text("Budget: ")
                            .font(.headline)
                            .fontWeight(.light)
                        
                        Text(task.budget, format: .currency(code: "USD"))
                            .font(.title3.bold())
                            .foregroundStyle(Color(hex:"#f03118"))
                        
                    }
                    .padding(.top, 8)
                    
                    
                    Divider()
                    
                    Text("Description: ")
                        .font(.headline)
                        .fontWeight(.light)
                        .padding(.top, 10)
                        .padding(.bottom, 5)

                    Text(task.details)
                        .font(.body)
                        
                                        
                    Spacer()
                    
                    
                    
                }
                .padding()
                
            } // ztack
            .navigationTitle("Task Details")
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                if task.done {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {}) {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                } else {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: markDone) {
                            Label("Done", systemImage: "checkmark")
                        }
                    }
                    
                }
            }
        } // nav stack
    } // body
    
    func markDone() {
        let taskId = task.id
        // fetch the task from SwiftData
        let fetchDesc = FetchDescriptor<Task> (
            predicate: #Predicate { dbTask in
                dbTask.id == taskId
            },
        )
        
        if let taskToUpdate = try? modelContext.fetch(fetchDesc).first {
            // update it
            taskToUpdate.done = true
            taskToUpdate.doneDate = Date()
        }
        
        // save the changes
        do {
            try modelContext.save()
            print("Task updated!")
        } catch {
            print("Error updating task: \(error)")
        }
        
    }
}

#Preview("Pending") {
    
    let work = Category(name: "Work", colorHex: "#b36827")
    let task1 = Task(title: "Mock Data 1", details: "long description here long description herelong description herelong description herelong description herelong description herelong description herelong description herelong description herelong description herelong description herelong description herelong description herelong description here", budget: 100, category: work)
    
    TaskDetailsView(task: task1)
}


#Preview("Done") {
    
    let work = Category(name: "Work", colorHex: "#b36827")
    let task1 = Task(title: "Mock Data 1", details: "long description here long description herelong description herelong description herelong description herelong description herelong description herelong description herelong description herelong description herelong description herelong description herelong description herelong description here", budget: 100, category: work)
    task1.done = true
    task1.doneDate = Date()
    
    return TaskDetailsView(task: task1)
}
