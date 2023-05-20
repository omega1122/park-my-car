//
//  SwiftUIView.swift
//  park my car
//
//  Created by Ayan Rajpurohit on 10/02/23.
//

import SwiftUI
import FirebaseAuth
struct SwiftUIView: View {
    
    
    @State var date: Date = Date()
    @State var bookedslots: [Int] = [4,6,7,8,45]
    @State var selslots: [Int] = []
    @State var seltime = "11:00"
    
      
        
       
        
        var time = ["10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00"]
        var body: some View {
            let totalslots: Int = 64
            let leftside = 0..<totalslots/2
            let rightside = totalslots/2..<totalslots
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("c1"),Color("c2")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                   
                    Text("Select Slots")
                        .font(.title)
                        .foregroundColor(.white)
                    HStack(spacing: 46) {
                        
                        let columns = Array(repeating: GridItem(.flexible(),spacing: 10), count: 4)
                        LazyVGrid(columns: columns,spacing: 10 , content: {
                            ForEach(leftside, id: \.self) { index in
                                seatview(index: index,   selslots: $selslots, bookedslots: $bookedslots)
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        if selslots.contains(index){
                                            selslots.removeAll { removeslot in
                                                return removeslot == index
                                            }
                                            return
                                        }
                                        selslots.append(index)
                                    }
                                    .disabled(bookedslots.contains(index))
                            }
                        })
                        
                        LazyVGrid(columns: columns,spacing: 10 , content: {
                            ForEach(rightside, id: \.self) { index in
                                seatview(index: index,   selslots: $selslots, bookedslots: $bookedslots)
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        if selslots.contains(index){
                                            selslots.removeAll { removeslot in
                                                return removeslot == index
                                            }
                                            return
                                        }
                                        selslots.append(index)
                                    }
                                    .disabled(bookedslots.contains(index))
                            }
                        })
                    }
                    HStack(alignment: .center, spacing: 20){
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color.gray,lineWidth: 4)
                            .frame(width: 28 ,height: 28)
                            .overlay{
                                Image(systemName: "xmark")
                                    .foregroundColor(.gray)
                            }
                        Text ("Booked")
                            .foregroundColor(.white)
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color("c1"),lineWidth: 4)
                            .frame(width: 28 ,height: 28)
                            .overlay{
                                Text("xy")
                                    .foregroundColor(.white)
                            }
                        Text ("Available")
                            .foregroundColor(.white)
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color("c1"),lineWidth: 4)
                            .frame(width: 28 ,height: 28)
                            .background(Color("c1"))
                        Text ("Selected")
                            .foregroundColor(.white)
                    }
                    .padding(.top,30)
                    HStack {
                        Text("DATE :")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.system(size: 22))
                        Spacer()
                        DatePicker("", selection: $date , displayedComponents: .date)
                        
                            .labelsHidden()
                        
                        
                    }.padding(.top,30)
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack {
                            ForEach(time , id: \.self ){ timi in
                                Text(timi)
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 22))
                                    .padding(.horizontal,17)
                                    .padding(.vertical,16)
                                    .background(Color("c1")).opacity( seltime == timi ? 1 : 0.4)
                                    .cornerRadius(15)
                                    .onTapGesture {
                                        seltime = timi
                                    }
                                
                            }
                        }.padding(.top,15)
                        
                    }
                    HStack{
                        VStack (alignment: .leading,spacing: 15){
                            Text("\(selslots.count) Seats")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                            Text (" Rs. \(selslots.count * 60) ")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                        }.padding(.horizontal,18)
                            .padding(.vertical,10)
                            .background(Color("c1"))
                            .cornerRadius(15)
                            .padding(.top)
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("BOOK SLOTS")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                        }.padding(.horizontal,30)
                            .padding(.vertical,17)
                            .background(Color("c1"))
                            .cornerRadius(15)
                            .padding(.top)
                        
                        
                    }.padding()
                        .padding(.bottom, 30)
                    
                }
            }
        }
   
    
    }

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
