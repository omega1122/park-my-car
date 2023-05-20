//
//  realview.swift
//  park my car
//
//  Created by Ayan Rajpurohit on 06/02/23.
//

import SwiftUI
import FirebaseAuth
struct realview: View {
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("c1"),Color("c2")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Button {
                        withAnimation{
                            
                            signout()
                            
                        }
                    } label: {
                        Text("LOGOUT")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 18))
                    }.padding(.horizontal,10)
                        .padding(.vertical,10)
                        .background(Color("c2"))
                        .cornerRadius(15)
                        .padding(.leading, 265)
                        .padding(.bottom,40)
                    Text("Select City Walk")
                        .font(.title)
                        .foregroundColor(.white)
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color("c1"),Color("c2")]), startPoint: .top, endPoint: .bottom))
                            .frame(width: 250,height: 400)
                            .offset(x: 12 , y: 12)
                        Image("mallpic")
                            .resizable()
                            .frame(width: 250,height: 400)
                            .cornerRadius(30)
                    }
                    .padding(.bottom,50)
                    NavigationLink {
                        SwiftUIView()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color.white)
                                .frame(width: 200, height: 46)
                              
                            Text("Book slots")
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.bottom,40)
                    Text("A-3, Saket District Centre, District Centre,Sector 6, Pushp Vihar, New Delhi, Delhi 110017")
                        .foregroundColor(.white)
                        .padding(.bottom,15)
                }
            }
        }
    }
    func signout (){
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        
        UserDefaults.standard.set(false, forKey: "sign")
       
        
       
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
      
    }
        
    }



    struct seatview: View{
        var index: Int
        
        @Binding var selslots: [Int]
        @Binding var bookedslots: [Int]
        var body: some View{
            ZStack{
                RoundedRectangle(cornerRadius: 7)
                    .stroke(bookedslots.contains(index) ? Color.gray : Color("c1"),lineWidth: 4)
                    .frame(height: 28)
                    .background(selslots.contains(index) ? Color("c1") : Color.clear)
                Text("\(index + 1)")
                    .foregroundColor(.white)
                if bookedslots.contains(index){
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                }
            }
        }
        
    }


struct realview_Previews: PreviewProvider {
    static var previews: some View {
       realview()
    }
}
