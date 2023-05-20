//
//  ContentView.swift
//  park my car
//
//  Created by Ayan Rajpurohit on 22/11/22.
//

import SwiftUI
import FirebaseAuth
struct loginview: View {
    @State var emailid: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                LinearGradient(gradient: Gradient(colors: [Color("c1"),Color("c2")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .italic()
                        .fontWeight(.heavy)
                        .padding(.bottom,268 )
                    
                    Image("car11")
                        .resizable()
                        .frame(width: 180 ,height: 80)
                        .padding(.bottom)
                    Text("Sign In")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .italic()
                        .fontWeight(.heavy)
                    VStack{
                        TextField("Email Id", text: $emailid)
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                            .keyboardType(.emailAddress)
                            .frame(width: 340)
                            .foregroundColor(.black)
                            .font(.headline)
                            .textFieldStyle(.roundedBorder)
                            .padding(.vertical,15)
                           
                        SecureField("Password", text: $password)
                            .frame(width: 340)
                            .foregroundColor(.black)
                            .font(.headline)
                            .textFieldStyle(.roundedBorder)
                        
                    }.padding(.bottom)
                    VStack{
                        NavigationLink ( destination:
                                            reset_password().navigationBarHidden(true) ,
                                         label: {
                            Text("Forgot password?")
                            
                                .foregroundColor(.white)
                            
                                .padding(.leading,200)
                        }).navigationBarHidden(true)
                        Button {
                            signinu()
                            
                        } label: {
                            
                            Text("Sign In ")
                                .foregroundColor(.black)
                                .font(.headline)
                            
                                .frame(width: 340,height: 29)
                            
                                .background(.white)
                            
                            
                        }
                        NavigationLink ( destination:
                                            new_account_view().navigationBarHidden(true)
                                         , label: {
                            Text("New User? Register here")
                                .foregroundColor(.white)
                            
                                .padding(.leading,150)
                                .padding(.top)
                        }).navigationBarHidden(true)
                        
                        
                    }
                    
                    
                }
            }
        }
        
    }
    func signinu() {
        Auth.auth().signIn(withEmail: emailid, password: password) {  authResult, error in
            if let err = error {
                print("error:\(err.localizedDescription)")
                return
            }
            UserDefaults.standard.set(true, forKey: "sign")
            print("signin")
            
           
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        loginview()
    }
}
