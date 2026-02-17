import SwiftUI
import SwiftData

struct SignupView: View {
    @Environment(\.modelContext) private var modelContext
    
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    @AppStorage("userId") private var userId: String = ""
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    @State var errorMessage: String = ""
    @State var showError: Bool = false
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                Backgrounds.gradient1.ignoresSafeArea()
                
                VStack {
                    
                    // title section
                    VStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundStyle(.white)
                        
                        Text("Sign Up")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        
                        
                        Text("Create an account to continue")
                            .font(.subheadline)
                            .foregroundStyle(Color(hex:"#D7D7D7"))
                    }
                    .padding(.bottom, 30)
                    
                    // form
                    VStack(spacing: 20) {
                        
                        //Error message
                        if showError {
                            HStack {
                                Text(errorMessage)
                                    .font(.caption)
                                    .foregroundColor(.white)
                                Spacer()
                                Button("Dismiss") {
                                    showError = false
                                }
                                .font(.caption)
                                .foregroundColor(.white)
                            }
                            .padding()
                            .background(Color.red.opacity(0.8))
                            .cornerRadius(8)
                        }
                                                                    
                        // first name
                        VStack(alignment:.leading) {
                            Text("First Name")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                            
                            TextField("Your name", text: $firstName)
                                .textFieldStyle(.plain)
                                .padding()
                                .background(.white.opacity(0.8))
                                .cornerRadius(10)
                        }
                        
                        
                        // last name
                        VStack(alignment:.leading) {
                            Text("Last Name")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                            
                            TextField("Your last name", text: $lastName)
                                .textFieldStyle(.plain)
                                .padding()
                                .background(.white.opacity(0.8))
                                .cornerRadius(10)
                        }
                        
                        // email
                        VStack(alignment:.leading) {
                            Text("Email")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                            
                            TextField("your mail", text: $email)
                                .textFieldStyle(.plain)
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .padding()
                                .background(.white.opacity(0.8))
                                .cornerRadius(10)
                                
                        }
                        
                        // password
                        VStack(alignment:.leading) {
                            Text("Password")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                            
                            SecureField("your pass", text: $password)
                                .textFieldStyle(.plain)
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled()
                                .padding()
                                .background(.white.opacity(0.8))
                                .cornerRadius(10)
                                
                        }
                        
                        // button
                        Button(action: performSignUp)
                        {
                            Text("Sign Up")
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(hex:"#FE7743"))
                                .cornerRadius(10)
                        }
                        .padding(.top, 10)
                        .padding(.horizontal, 50)
                        
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                }
            }
            
        }
        
    }
    
    private func showError(message: String) {
        errorMessage = message
        showError = true
    }
    
    private func performSignUp() {
        
        guard !firstName.isEmpty, !lastName.isEmpty else {
            showError(message: "Please enter your first and last name")
            //print("Please enter your first and last name")
            return
        }
        
        guard !email.isEmpty, email.contains("@") else {
            showError(message: "Please enter a valid email address")
            //print("Please enter a valid email address")
            return
        }
        
        guard password.count >= 6 else {
            showError(message: "Password must be at least 6 characters")
            //print("Password must be at least 6 characters")
            return
        }
        
        let newUser = User(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password
        )
        
        modelContext.insert(newUser)
        
        do {
            try modelContext.save()
            print("User saved")
            // auto-login after creating
            userId = newUser.id
            isLoggedIn = true
        }
        catch {
            showError(message: "Failed to create account. Please try again.")
            print("Error saving user: \(error)")
        }
        
    }
    
}

#Preview {
    SignupView()
}
