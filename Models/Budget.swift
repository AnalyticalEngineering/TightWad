//
//  Budget.swift
//  TightWad
//
//  Created by J. DeWeese on 1/23/24.
//

import SwiftUI
import SwiftData

@Model
class Budget {
    var budgetName: String
    var budgetAmount: Double
    
    /// Category Expenses
    @Relationship(deleteRule: .cascade, inverse: \Transaction.budget)
    var expenses: [Transaction]?
    
    init(budgetName: String, budgetAmount: Double) {
        self.budgetName = budgetName
        self.budgetAmount = budgetAmount
       
    }
    /// Currency String
    @Transient
    var budgetCurrencyString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(for: budgetAmount) ?? ""
    }
   
    
}
