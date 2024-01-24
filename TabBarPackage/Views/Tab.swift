//
//  Tab.swift
//  TightWad
//
//  Created by J. DeWeese on 1/23/24.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case transactions = "Transactions"
    case charts = "Progress"
    case settings = "Settings"
    
    var systemImage: String {
        switch self {
        case .transactions:
            return "minus.forwardslash.plus"
        case .charts:
            return "chart.bar.xaxis"
        case .settings:
            return "gear"
            
        }
    }
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}
