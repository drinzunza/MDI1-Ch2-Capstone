import SwiftUI

struct CategoryRowView: View {
    
    let category: Category
    
    var body: some View {
        HStack(alignment:.center) {
            Circle()
                .fill(Color(hex: category.colorHex))
                .frame(width: 15, height: 15)
            
            Text(category.name)
            
            Spacer()
        }
        .padding(.horizontal, 5)
        
    }
}

#Preview {
    
    let cat = Category(name: "Test", colorHex: "#FF0000")
    
    CategoryRowView(category: cat)
}
