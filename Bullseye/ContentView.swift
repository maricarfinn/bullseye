//
//  ContentView.swift
//  Bullseye
//
//  Created by Maricar Finn on 27/05/2020.
//  Copyright © 2020 Maricar Finn. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    
    @State var score = 0
    @State var currentRound = 1
    
    var body: some View {
        VStack {
            Spacer()
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                    .foregroundColor(Color.white)
                Text ("\(target)")
            }
            Spacer()
            // Slider row
            HStack {
                Text ("1")
                Slider(value: $sliderValue, in: 1...100)
                Text ("100")
            }
            Spacer()
            //Button row
            Button(action: {
                self.alertIsVisible = true
                self.score = self.score + self.pointsForCurrentRound()
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit me"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) { () ->
                Alert in
                return Alert(title: Text(alertTitle()), message: Text("The slider's value is \(sliderValueRounded()).\n" +
                
                    "You scored \(pointsForCurrentRound()) points this round"), dismissButton: .default(Text("Awesome!")) {
                        self.target = Int.random(in: 1...100)
                        self.currentRound = self.currentRound + 1
                    }
                
                )
                
            }
            Spacer()
            // Score row
            
            HStack {
                Button(action: {
                    self.resetGame()
                }) {
                    Text("Start over")
                }
                Spacer()
                Text ("Score:")
                Text("\(Int(score))")
                Spacer()
                Text ("Round:")
                Text("\(Int(currentRound))")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
        .background(Image("Background"), alignment: .center)
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func amountOff() -> Int {
        return abs(target - sliderValueRounded())
    }
    
    func pointsForCurrentRound () -> Int {
        
        let maximumScore = 100
        let difference = amountOff()
        let bonus: Int
        
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maximumScore - difference + bonus
    }
    
    func alertTitle() -> String {
        let difference = amountOff()
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
            
        } else if difference < 5 {
            title = "You almost had it"
        } else if difference <= 10 {
            title = "Not bad"
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
    func resetGame() {
        
        score = 0
        currentRound = 1
        sliderValue = 50.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
