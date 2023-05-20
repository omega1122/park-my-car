//
//  reset password.swift
//  park my car
//
//  Created by Ayan Rajpurohit on 23/11/22.
//

import SwiftUI
import FirebaseAuth
struct reset_password: View {
    @State var start: Bool = false
    @State var emailiddd: String = ""
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("c1"),Color("c2")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack{
                
                Text("Reset Password")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .italic()
                    .fontWeight(.heavy)
                    .padding(.bottom)
                VStack{
                    TextField("Email Id", text: $emailiddd)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .keyboardType(.emailAddress)
                        .frame(width: 340)
                        .foregroundColor(.black)
                        .font(.headline)
                        .textFieldStyle(.roundedBorder)
                        .padding(.vertical,15)
                    
                    Button {
                        resetp()
                        start.toggle()
                    } label: {
                        
                        Text("Reset Password")
                            .foregroundColor(.black)
                            .font(.headline)
                            
                            .frame(width: 340,height: 39)
                            
                            .background(.white)
                            
                        
                    }
                    
                    Text(start == true ? "Please check your email inbox" : "Please press Reset Password button after entering your registered email id ")
                        .font(.system(size: 20))
                        .padding(.vertical,50)
                        .foregroundColor(start == true ? .white : .black)
                    Spacer()
                    NavigationLink(destination:
                                    loginview().navigationBarHidden(true),
                     label: {
                        Text("Back To Login")
                            .foregroundColor(.white )
                    }).navigationBarHidden(true)

                }
            }
        }
    }
    private func resetp(){
        Auth.auth().sendPasswordReset(withEmail: emailiddd){
            error in
            if let err = error {
                print("error:\(err.localizedDescription)")
                return
            }
           
                print (" password reset succcessfully ")
          
        }
    }
}
struct reset_password_Previews: PreviewProvider {
    static var previews: some View {
        reset_password()
    }
}
