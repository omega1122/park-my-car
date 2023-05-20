//
//  new account view.swift
//  park my car
//
//  Created by Ayan Rajpurohit on 23/11/22.
//

import SwiftUI
import FirebaseAuth

struct new_account_view: View {
    
   
    @State var emailidd: String = ""
    @State var passwordd: String = ""
    @State var rpasswordd: String = ""
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("c1"),Color("c2")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack{
                
                Text("Create New Account")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .italic()
                    .fontWeight(.heavy)
                    .padding(.bottom,80)
                VStack{
                    TextField("Email Id", text: $emailidd)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .keyboardType(.emailAddress)
                        .frame(width: 340)
                        .foregroundColor(.black)
                        .font(.headline)
                        .autocorrectionDisabled()
                        .keyboardType(.emailAddress)
                        .textFieldStyle(.roundedBorder)
                        .padding(.vertical,15)
                    SecureField("Password", text: $passwordd)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .frame(width: 340)
                        .foregroundColor(.black)
                        .font(.headline)
                        .textFieldStyle(.roundedBorder)
                    
                    SecureField("Retype Password", text: $rpasswordd)
                        .frame(width: 340)
                        .foregroundColor(.black)
                        .font(.headline)
                        .textFieldStyle(.roundedBorder)
                    
                }.padding(.bottom)
                VStack{
                    
                    
                    Button {
                        newuser()
                        
                    } label: {
                        
                        Text("Create Account  ")
                            .foregroundColor(.black)
                            .font(.headline)
                        
                            .frame(width: 340,height: 39)
                        
                            .background(.white)
                        
                        
                    }
                    
                    
                    
                }
                Spacer()
                VStack{
                    NavigationLink (destination:
                                        loginview().navigationBarHidden(true)
                                    ,label: {
                        Text("Already Have an account?  Login")
                            .foregroundColor(.white)
                    }).navigationBarHidden(true)
                    
                }
                
                
            }
        }
        
        
    }
    private func  newuser (){
        if passwordd != rpasswordd {
            return
        }
        if passwordd.count < 6 {
            return
        }
        Auth.auth().createUser(withEmail: emailidd, password: passwordd) { authResult, error in
            if let err = error {
                print("error:\(err.localizedDescription)")
                return
            }
            UserDefaults.standard.set(true, forKey: "sign")
                print (" new user register succcessfully ")
           
          
        }
    }
}

struct new_account_view_Previews: PreviewProvider {
    static var previews: some View {
        new_account_view()
    }
}
