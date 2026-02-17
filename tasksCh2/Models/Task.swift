import Foundation
import SwiftData

@Model
final class Task: Identifiable {
    var id: UUID // auto generated
    var createdAt: Date  // auto generated
    var title: String
    var details: String
    var done: Bool
    var doneDate: Date?
    var budget: Decimal // money
    
    // relationship: Each task belong to/has a category
    var category: Category
    
    init(title: String, details: String, budget: Decimal, category: Category) {
        self.id = UUID()
        self.createdAt = Date() // now
        self.title = title
        self.details = details
        self.done = false
        self.budget = budget
        self.category = category
    }
}
