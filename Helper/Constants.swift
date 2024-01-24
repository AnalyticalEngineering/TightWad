//
//  Constants.swift
//  TightWad
//
//  Created by J. DeWeese on 1/23/24.
//
import SwiftUI


@Observable
class Constants {
    static let shared = Constants()
    
    var appTint: String = UserDefaults.standard.string(forKey: "appTint") ?? "Red"
    
    var tintColor: Color {
        return tints.first { $0.color == appTint }?.value ?? .red
    }
}
