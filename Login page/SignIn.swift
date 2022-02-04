//
//  SignIn.swift
//  Login page
//
//  Created by Augustin Diabira on 30/01/2022.
//

import SwiftUI
import FirebaseAuth


class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password){[weak self] result, error in
            
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
               
                self?.signedIn = true
            }
        }
        
    }
    
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                
                self?.signedIn = true
            }
        }
    }
    
    func signOut(){
        try? auth.signOut()
        
        self.signedIn = false
    }
}

struct SignIn: View {
    
    @State var email = ""
    @State var password = ""
    @State var isRegisterPage = false
    @EnvironmentObject var model:AppViewModel
    
    
    var body: some View {
        NavigationView {
            
//            LinearGradient(colors: [.purple, .blue, .red], startPoint: .bottomLeading, endPoint: .topTrailing).ignoresSafeArea()
            ZStack {
                LinearGradient(colors: [.purple, .blue, .red], startPoint: .bottomLeading, endPoint: .topTrailing).ignoresSafeArea()
                
               
                if model.signedIn {
                    Home()
                }else {
                    if isRegisterPage {
                        SignUp(isRegisterPage: $isRegisterPage)
                    }else {
                        LogIn( isRegisterPage: $isRegisterPage)
                    }
                }
                    
                
              
            }
        }.onAppear {
            model.signedIn = model.isSignedIn
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn( )
    }
}

struct SignUp: View {
    @State var email = ""
    @State var password = ""
    @Binding var isRegisterPage:Bool
    @EnvironmentObject var model:AppViewModel
    var body: some View {
        VStack {
            Text("Register").bold()
                .font(.largeTitle)
                .textCase(.uppercase)
                .padding(.trailing, 204)
                .foregroundColor(.white)
            
            TextField("Email..",text: $email ).padding()
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(15)
                .padding()
            
            SecureField("Password...", text: $password) .padding() .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(15)
                .padding()
            
            
            
            
            Button {
                guard !email.isEmpty, !password.isEmpty else {
                    return
                }

                model.signUp(email: email, password: password)
            } label: {
                Text("Sign Up").bold().padding() .background(Color.accentColor)
                
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .padding()
            }
            Button {
                isRegisterPage = false
            } label: {
                Text("Already a member of Hologram ? Log in here").foregroundColor(Color.white)
            }
        }
    }
}

struct LogIn: View {
    @State var email = ""
    @State var password = ""
    @Binding var isRegisterPage:Bool
    @EnvironmentObject var model:AppViewModel
  
    var body: some View {
        VStack {
            Text("Sign In").bold()
                .font(.largeTitle)
                .textCase(.uppercase)
                .padding(.trailing, 254)
                .foregroundColor(.white)
            
            TextField("Email..",text: $email ).padding()
                .background(Color.white)
                .cornerRadius(15)
                .padding()
            
            SecureField("Password...", text: $password) .padding() .background(Color.white)
                .cornerRadius(15)
                .padding()
            
            Button {
                
                guard !email.isEmpty, !password.isEmpty else {
                    return
                }

                model.signIn(email: email, password: password)
               
            } label: {
                Text("Log In").bold().padding() .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .padding()
            }
            Button {
                isRegisterPage = true
            } label: {
                Text("Haven't signed up yet ? Register Here").foregroundColor(Color.white)
            }

               
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        }
    }
}
