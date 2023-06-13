//
//  ContentView.swift
//  RGBSliderSwiftUI
//
//  Created by AbuYusuf on 13.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color(.cyan).ignoresSafeArea()
            VStack(spacing: 30) {
                Color(
                    red: redSliderValue / 255,
                    green: greenSliderValue / 255,
                    blue: blueSliderValue / 255
                )
                    .frame(height: 130)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 4)
                            .foregroundColor(.white)
                            .shadow(radius: 10)
                    )
                VStack {
                    ColorSliderView(value: $redSliderValue, color: .red)
                    ColorSliderView(value: $greenSliderValue, color: .green)
                    ColorSliderView(value: $blueSliderValue, color: .blue)
                    Spacer()
                }
            }
            .padding()
        }
    }
}

struct ColorSliderView: View {
    @Binding var value: Double
    let color: Color
    
    var body: some View {
        HStack{
            Text("\(lround(value))")
                .frame(width: 40)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
