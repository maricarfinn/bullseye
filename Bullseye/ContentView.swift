//
//  ContentView.swift
//  Bullseye
//
//  Created by Maricar Finn on 27/05/2020.
//  Copyright © 2020 Maricar Finn. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    
    var body: some View {
        VStack {
            // Target row
            Text("Welcome to my first app")
                .fontWeight(.semibold)
                .foregroundColor(Color.green)
            
            // Slider row
            
            //Button row
            Button(action: {
                print("Button pressed")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit me"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) { () ->
                Alert in
                return Alert(title: Text("Hello there!"), message: Text("This is my first pop-up."), dismissButton: .default(Text("Awesome!")))
            }
            
            // Score row
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
