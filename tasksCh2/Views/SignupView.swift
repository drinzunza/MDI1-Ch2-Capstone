import SwiftUI

struct SignupView: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
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
                        Button(action:{})
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
    
}

#Preview {
    SignupView()
}
