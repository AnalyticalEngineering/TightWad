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
        
        /// For Animation Purpose
        NavigationStack{
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
                            expense: total(transactions, transactionType: .expense))
                        
                        /// Custom Segmented Control
                        CustomSegmentedControl()
                            .padding()
                        
                        ForEach(transactions.filter({ $0.transactionType == selectedTransactionType.rawValue })) { transaction in
                            NavigationLink(value: transaction) {
                                TransactionCardView()
                            }
                            .buttonStyle(.plain)
                            Spacer()
                        }
                    }
                }
            }
        }
    }


    
    /// Segmented Control
    @ViewBuilder
    func CustomSegmentedControl() -> some View {
        HStack(spacing: 0) {
            ForEach(TransactionType.allCases, id: \.rawValue) { transactionType in
                Text(transactionType.rawValue)
                    .hSpacing()
                    .padding(.vertical, 10)
                    .background {
                        if transactionType == selectedTransactionType {
                            Capsule( )
                                .fill(appTint.gradient)
                                .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                        }
                    }
                    .contentShape(.capsule)
                    .onTapGesture {
                        withAnimation(.snappy) {
                            selectedTransactionType = transactionType
                        }
                    }
            }
        }
        .background(.gray.opacity(0.15), in: .capsule)
       
       
    }
    
    func headerBGOpacity(_ proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView).minY + safeArea.top
        return minY > 0 ? 0 : (-minY / 15)
    }
    
    func headerScale(_ size: CGSize, proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView).minY
        let screenHeight = size.height
        
        let progress = minY / screenHeight
        let scale = (min(max(progress, 0), 1)) * 0.4
        
        return 1 + scale
    }
}
#Preview {
 TransactionView()
}
