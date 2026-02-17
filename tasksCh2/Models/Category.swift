import Foundation
import SwiftData

@Model
final class Category: Identifiable {
    var id: UUID // auto generated
    var name: String
    var colorHex: String
    
    @Relationship(deleteRule: .cascade)
    var tasks: [Task] = []
    
    init(name: String, colorHex: String) {
        self.id = UUID()
        self.name = name
        self.colorHex = colorHex
    }
}
