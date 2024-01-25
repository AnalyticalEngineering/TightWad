//
//  TransactionView.swift
//  TightWad
//
//  Created by J. DeWeese on 1/23/24.
//

import SwiftUI
import SwiftData

struct TransactionView: View {
    /// User Properties
    @AppStorage("userName") private var userName: String = ""
    /// View Properties
    @State private var startDate: Date = .now.startOfMonth
    @State private var endDate: Date = .now.endOfMonth
    @State private var showFilterView: Bool = false
    @State private var selectedTransactionType: TransactionType = .expense
    /// For Animation
    @Namespace private var animation
    var body: some View {
    
            VStack {
                ///Header View
                HeaderView()
                    .padding(.top, 20)
                    .padding(.bottom,20)
                            FilterTransactionsView(startDate: startDate, endDate: endDate) { transactions in
                                /// Card View
                                ScrollView {
                                ScoreCardView(
                                    income: total(transactions, transactionType: .income),
                                    expense: total(transactions, transactionType: .expense)
                                )
                            }
                         Spacer()
            }
        }
       
                }
            }
        

#Preview {
 TransactionView()
}
