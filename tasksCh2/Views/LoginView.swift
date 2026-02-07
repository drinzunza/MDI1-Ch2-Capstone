import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
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
                        Button(action:{})
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
                        
                        
                        Button(action: {}) {
                            Text(" Sign up here ")
                                .padding()
                                .background(Color(hex:"D7D7D7"))
                                .cornerRadius(10)
                        }
                        
                    }
                    
                    Spacer()
                    
                }
                
            }
        }
    }
}

#Preview {
    LoginView()
}
