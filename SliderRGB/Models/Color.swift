//
//  Color.swift
//  SliderRGB
//
//  Created by Ast on 02.03.2025.
//

import Foundation

struct Color {
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    let alpha: CGFloat
    
    var rgb: String {
        "\(red), \(green), \(blue), \(alpha)"
    }
}


