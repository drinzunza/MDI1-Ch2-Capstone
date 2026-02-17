import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Volumes/L3R3/Documents/Code/SDGKU/MDI_118/CH02/MDI1-Ch2-Capstone/tasksCh2/Views/LoginView.swift", line: 1)
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
                        Image(systemName: __designTimeString("#3895_0", fallback: "person.circle.fill"))
                            .resizable()
                            .frame(width: __designTimeInteger("#3895_1", fallback: 60), height: __designTimeInteger("#3895_2", fallback: 60))
                            .foregroundStyle(.white)
                        
                        Text(__designTimeString("#3895_3", fallback: "Login"))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        
                        
                        Text(__designTimeString("#3895_4", fallback: "Enter your credentials to continue"))
                            .font(.subheadline)
                            .foregroundStyle(Color(hex:__designTimeString("#3895_5", fallback: "#D7D7D7")))
                    }
                    .padding(.bottom, __designTimeInteger("#3895_6", fallback: 30))
                    .padding(.top, __designTimeInteger("#3895_7", fallback: 40))
                                        
                    
                    // form
                    VStack(spacing: __designTimeInteger("#3895_8", fallback: 20)) {
                        // email
                        VStack(alignment:.leading) {
                            Text(__designTimeString("#3895_9", fallback: "Email"))
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                            
                            TextField(__designTimeString("#3895_10", fallback: "your mail"), text: $email)
                                .textFieldStyle(.plain)
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .padding()
                                .background(.white.opacity(__designTimeFloat("#3895_11", fallback: 0.8)))
                                .cornerRadius(__designTimeInteger("#3895_12", fallback: 10))
                            
                        }
                        
                        // password
                        VStack(alignment:.leading) {
                            Text(__designTimeString("#3895_13", fallback: "Password"))
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                            
                            SecureField(__designTimeString("#3895_14", fallback: "your pass"), text: $password)
                                .textFieldStyle(.plain)
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled()
                                .padding()
                                .background(.white.opacity(__designTimeFloat("#3895_15", fallback: 0.8)))
                                .cornerRadius(__designTimeInteger("#3895_16", fallback: 10))
                            
                        }
                        
                        // button
                        Button(action:{})
                        {
                            Text(__designTimeString("#3895_17", fallback: "Login"))
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(hex:__designTimeString("#3895_18", fallback: "#FE7743")))
                                .cornerRadius(__designTimeInteger("#3895_19", fallback: 10))
                        }
                        .padding(.top, __designTimeInteger("#3895_20", fallback: 10))
                        .padding(.horizontal, __designTimeInteger("#3895_21", fallback: 50))
                        
                    
                    }
                    .padding(.horizontal, __designTimeInteger("#3895_22", fallback: 20))
                    
                    // sign up button
                    VStack {
                        Divider()
                            .padding(.vertical, __designTimeInteger("#3895_23", fallback: 20))
                            .padding(.horizontal, __designTimeInteger("#3895_24", fallback: 20))
                        
                        Text(__designTimeString("#3895_25", fallback: "Do you need an account?"))
                            .font(.subheadline)
                            .foregroundStyle(Color(hex:__designTimeString("#3895_26", fallback: "#fafafa")))
                        
                        
                        Button(action: {}) {
                            Text(__designTimeString("#3895_27", fallback: " Sign up here "))
                                .padding()
                                .background(Color(hex:__designTimeString("#3895_28", fallback: "D7D7D7")))
                                .cornerRadius(__designTimeInteger("#3895_29", fallback: 10))
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
