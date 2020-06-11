//
//  AboutView.Swift
//  Bullseye
//
//  Created by Maricar Finn on 05/06/2020.
//  Copyright © 2020 Maricar Finn. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    let beige = Color(red: 255.0 / 255.0, green: 214.0 / 255.0, blue: 179.0 / 255.0)
    
    struct Heading: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                .multilineTextAlignment(.center)
        }
    }
    
    struct TextViews: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .padding(EdgeInsets(top: 20, leading: 60, bottom: 20, trailing: 60))
                .multilineTextAlignment(.center)
                .lineLimit(nil)
        }
    }
    
    var body: some View {
        Group {
            VStack {
                Text("🎯 Bullseye 🎯").modifier(Heading())
                Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider").modifier(TextViews())
                Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(TextViews())
                Text("Enjoy!").modifier(TextViews())
            }
            .navigationBarTitle("About Bullseye")
            .background(beige)
        }
        .background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
