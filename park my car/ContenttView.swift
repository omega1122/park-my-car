//
//  ContentView.swift
//  park my car
//
//  Created by Ayan Rajpurohit on 11/02/23.
//

import SwiftUI

struct ContenttView: View {
    @AppStorage("sign") var isignedin = false
    var body: some View {
        if isignedin == false {
            loginview()
        }
        else {
            realview()
        }
    }
}

struct ContenttView_Previews: PreviewProvider {
    static var previews: some View {
        ContenttView()
    }
}
