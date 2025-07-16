//
//  SwiftUIView.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 2/2/25.
//

import SwiftUI

struct ColorPalette {
    let red: Double
    let green: Double
    let blue: Double
    let opacity: Double
    
    
    init(red: Double, green: Double, blue: Double, opacity: Double) {
        self.red = red
        self.green = green
        self.blue = blue
        self.opacity = opacity
    }
    
    var color: Color {
           Color(red: red, green: green, blue: blue, opacity: opacity)
       }
    
}

extension ColorPalette{
    var softColor: Color{
        Color(red: red, green: green, blue: blue, opacity: 0.0)
    }
}
