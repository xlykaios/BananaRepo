//
//  FocusButton.swift
//  hometest
//
//  Created by Antonio Giordano on 24/10/22.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0.972, green: 0.411, blue: 0.414))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.8 : 1.3)
            .animation(.easeIn(duration: 0.2), value: configuration.isPressed)
    }
}

struct FocusButton: View {
    @State private var isFocusViewPresented: Bool = false
    var body: some View {
        Button("Tap to Focus"){
            isFocusViewPresented.toggle()
        }
        .padding()
                .buttonStyle(GrowingButton())
                .sheet(isPresented: $isFocusViewPresented) {
                    FocusView()
                }
    }
}

struct FocusButton_Previews: PreviewProvider {
    static var previews: some View {
        FocusButton()
    }
}
