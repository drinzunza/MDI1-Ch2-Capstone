import Foundation
import SwiftData
import CryptoKit

@Model
final class User: Identifiable {
    var id: String
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    
    init(firstName: String, lastName: String, email: String, password: String) {
        self.id = UUID().uuidString
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        // hash the plain password before saving it
        self.password = User.hashPassword(password)
    }
    
    static func hashPassword(_ password: String) -> String {
        let data = Data(password.utf8)
        let hash = SHA256.hash(data: data)
        return hash.compactMap{ String(format: "%02x", $0)}.joined()
    }
    
}
