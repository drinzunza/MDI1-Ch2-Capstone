import SwiftUI

struct TaskRowView: View {
    
    let task: Task
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            // row 1
            HStack {
                Text(task.title)
                    .font(.headline)
            }
            
            // row 2
            HStack {
                // date
                Text(task.createdAt, format: .dateTime)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                // Budget
                Text(task.budget, format:.currency(code: "USD"))
                    .font(.subheadline)
                    .fontWeight(.bold)
                
            }
            
        } // vstack
        .padding()
        .background(.ultraThinMaterial)
        .overlay(
            Rectangle()
                .fill(Color(hex: task.category.colorHex))
                .frame(width: 6)
            ,
            alignment: .leading
        )
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(color: .black.opacity(0.1), radius: 4, y: 2)
        .padding(.vertical, 6) // space between rows
        
    }
}

#Preview {
    
    let cat1 = Category(name: "Test", colorHex: "#FF0000")
    
    
    let t1 = Task(
            title: "My Test Task for Preview",
            details: "This is the task that I will display in the preview. This is the task that I will display in the preview. This is the task that I will display in the preview.",
            budget: 12.99,
            category: cat1
    )
    
    TaskRowView(task: t1)
}
