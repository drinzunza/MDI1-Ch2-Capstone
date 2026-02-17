import SwiftUI
import SwiftData

struct LoginView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("userId") var userId: String = ""
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var invalidLogin: Bool = false
    @State private var errorMessage: String = ""
    @State private var showSignUp: Bool = false
    
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
                        
                        Text("Login")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        
                        
                        Text("Enter your credentials to continue")
                            .font(.subheadline)
                            .foregroundStyle(Color(hex:"#D7D7D7"))
                    }
                    .padding(.bottom, 30)
                    .padding(.top, 40)
                                        
                    
                    // form
                    VStack(spacing: 20) {
                        //error messages
                        if invalidLogin {
                            HStack {
                                Text(errorMessage)
                                    .font(.caption)
                                    .foregroundColor(.white)
                                Spacer()
                                Button("Dismiss") {
                                    invalidLogin = false
                                }
                                .font(.caption)
                                .foregroundColor(.white)
                            }
                            .padding()
                            .background(Color.red.opacity(0.8))
                            .cornerRadius(8)
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
                        Button(action: performLogin)
                        {
                            Text("Login")
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(hex:"#FE7743"))
                                .cornerRadius(10)
                        }
                        .padding(.top, 10)
                        .padding(.horizontal, 50)
                        
                    
                    }
                    .padding(.horizontal, 20)
                    
                    // sign up button
                    VStack {
                        Divider()
                            .padding(.vertical, 20)
                            .padding(.horizontal, 20)
                        
                        Text("Do you need an account?")
                            .font(.subheadline)
                            .foregroundStyle(Color(hex:"#fafafa"))
                        
                        
                        Button(action: { showSignUp = true }) {
                            Text(" Sign up here ")
                                .padding()
                                .background(Color(hex:"D7D7D7"))
                                .cornerRadius(10)
                        }
                    }
                    Spacer()
                }
            }
            .navigationDestination(isPresented: $showSignUp) {
                SignupView()
            }
        }
    }
    
    private func performLogin(){
        //validations
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Email and Password are required fields"
            invalidLogin = true
            return
        }
        
        //find user by email
        let lowerEmail = email.lowercased()
        let descriptor = FetchDescriptor<User>(
            predicate: #Predicate<User> {
                $0.email == lowerEmail }
        )
            
        guard let users = try? modelContext.fetch(descriptor),
            let user = users.first else {
                errorMessage = "Account not found, verify your email"
                invalidLogin = true
                return
            }
        
        //verify the password
        let passwordHash = User.hashPassword(password)
        guard passwordHash == user.password else {
            errorMessage = "Invalid Password"
            invalidLogin = true
            return
        }
        
        //successful login
        invalidLogin = false
        userId = user.id
        isLoggedIn = true
        
    }
    
}

#Preview {
    LoginView()
}
