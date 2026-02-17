import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Volumes/L3R3/Documents/Code/SDGKU/MDI_118/CH02/MDI1-Ch2-Capstone/tasksCh2/Views/SignupView.swift", line: 1)
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
                        Image(systemName: __designTimeString("#3496_0", fallback: "person.circle.fill"))
                            .resizable()
                            .frame(width: __designTimeInteger("#3496_1", fallback: 60), height: __designTimeInteger("#3496_2", fallback: 60))
                            .foregroundStyle(.white)
                        
                        Text(__designTimeString("#3496_3", fallback: "Sign Up"))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        
                        
                        Text(__designTimeString("#3496_4", fallback: "Create an account to continue"))
                            .font(.subheadline)
                            .foregroundStyle(Color(hex:__designTimeString("#3496_5", fallback: "#D7D7D7")))
                    }
                    .padding(.bottom, __designTimeInteger("#3496_6", fallback: 30))
                    
                    // form
                    VStack(spacing: __designTimeInteger("#3496_7", fallback: 20)) {
                                                                    
                        // first name
                        VStack(alignment:.leading) {
                            Text(__designTimeString("#3496_8", fallback: "First Name"))
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                            
                            TextField(__designTimeString("#3496_9", fallback: "Your name"), text: $firstName)
                                .textFieldStyle(.plain)
                                .padding()
                                .background(.white.opacity(__designTimeFloat("#3496_10", fallback: 0.8)))
                                .cornerRadius(__designTimeInteger("#3496_11", fallback: 10))
                        }
                        
                        
                        // last name
                        VStack(alignment:.leading) {
                            Text(__designTimeString("#3496_12", fallback: "Last Name"))
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                            
                            TextField(__designTimeString("#3496_13", fallback: "Your last name"), text: $lastName)
                                .textFieldStyle(.plain)
                                .padding()
                                .background(.white.opacity(__designTimeFloat("#3496_14", fallback: 0.8)))
                                .cornerRadius(__designTimeInteger("#3496_15", fallback: 10))
                        }
                        
                        // email
                        VStack(alignment:.leading) {
                            Text(__designTimeString("#3496_16", fallback: "Email"))
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                            
                            TextField(__designTimeString("#3496_17", fallback: "your mail"), text: $email)
                                .textFieldStyle(.plain)
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .padding()
                                .background(.white.opacity(__designTimeFloat("#3496_18", fallback: 0.8)))
                                .cornerRadius(__designTimeInteger("#3496_19", fallback: 10))
                                
                        }
                        
                        // password
                        VStack(alignment:.leading) {
                            Text(__designTimeString("#3496_20", fallback: "Password"))
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                            
                            SecureField(__designTimeString("#3496_21", fallback: "your pass"), text: $password)
                                .textFieldStyle(.plain)
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled()
                                .padding()
                                .background(.white.opacity(__designTimeFloat("#3496_22", fallback: 0.8)))
                                .cornerRadius(__designTimeInteger("#3496_23", fallback: 10))
                                
                        }
                        
                        // button
                        Button(action:{})
                        {
                            Text(__designTimeString("#3496_24", fallback: "Sign Up"))
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(hex:__designTimeString("#3496_25", fallback: "#FE7743")))
                                .cornerRadius(__designTimeInteger("#3496_26", fallback: 10))
                        }
                        .padding(.top, __designTimeInteger("#3496_27", fallback: 10))
                        .padding(.horizontal, __designTimeInteger("#3496_28", fallback: 50))
                        
                        
                        Spacer()
                    }
                    .padding(.horizontal, __designTimeInteger("#3496_29", fallback: 20))
                    
                }
            }
            
        }
    }
    
}

#Preview {
    SignupView()
}
