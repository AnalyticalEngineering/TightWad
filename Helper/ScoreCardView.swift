//
//  ScoreCardView.swift
//  TightWad
//
//  Created by J. DeWeese on 1/24/24.
//

import SwiftUI

struct ScoreCardView: View {
    //MARK:  PROPERTIES
    var income: Double
    var expense: Double
    /// View Properties
    @State private var startDate: Date = .now.startOfMonth
    @State private var endDate: Date = .now.endOfMonth
    @State private var showFilterView: Bool = false
    @State private var selectedTransactionType: TransactionType = .expense
    
    var body: some View {
        ZStack(alignment: .top){
            
            VStack(spacing: 0) {
                
                
                Text("Savings")
                    .font(.caption2)
                    .foregroundStyle(.white)
                    .padding(5)
                HStack(spacing: 12) {
                    Text("\(currencyString(income - expense))")
                        .font(.headline.bold())
                    
                    Image(systemName: expense > income ? "chart.line.downtrend.xyaxis" : "chart.line.uptrend.xyaxis")
                        .font(.title3)
                        .foregroundStyle(expense > income ? .colorRed : .colorGreen)
                }
                .padding(.bottom, 25)
                
                HStack(spacing: 0) {
                    ForEach(TransactionType.allCases, id: \.rawValue) { transactionType in
                        let symbolImage = transactionType == .income ? "arrow.down" : "arrow.up"
                        let tint = transactionType == .income ? Color.colorGreen : Color.colorRed
                        
                        VStack(spacing: 50) {
                            
                            Image(systemName: symbolImage)
                                .font(.callout.bold())
                                .foregroundStyle(.primary)
                                .frame(width: 35, height: 35)
                                .background {
                                    Circle()
                                        .fill(tint.opacity(0.25).gradient)
                                }
                            Spacer()
                        }
                        VStack(alignment: .leading) {
                            Text(transactionType.rawValue)
                                .font(.caption2)
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                            
                            Text(currencyString(transactionType == .income ? income : expense, allowedDigits: 0))
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundStyle(.primary)
                            
                            
                        }
                        
                        if transactionType == .income {
                            Spacer(minLength: 5)
                        }
                    }
                }
                /// Date Filter Button
                Text("Choose Date Range")
                    .foregroundStyle(appTint)
                    .padding(.bottom, 5)
                Button(action: {
                    showFilterView = true
                    HapticManager.notification(type: .success)
                }, label: {
                    Text("\(format(date: startDate,format: "dd - MMM yy")) to \(format(date: endDate,format: "dd - MMM yy"))")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(appTint)
                    
                })
                .hSpacing(.center)
                .overlay {
                    RoundedRectangle(cornerRadius:  16)
                        .stroke(appTint, lineWidth: 2)
                        .padding(-8)
                }
                .frame(width: .widthPer(per: 0.40), height: .widthPer(per: 0.06))
            }
            .frame(width: .widthPer(per: 0.94), height: .widthPer(per: 0.1))
            .overlay {
                ZStack{
                    ArcShape()
                        .stroke( Color(.colorBackground), lineWidth: 2)
                        .frame(width: .widthPer(per: 0.43))
                        .offset(x: 1)
                        .offset(y: -30)
                    ArcShape(start: 0, end: 230)
                        .frame(width: .widthPer(per: 0.43))
                        .foregroundColor(Color.colorGreen)
                        .shadow( color: Color.colorGreen, radius: 2)
                        .offset(x: 1)
                        .offset(y: -30)
                }
            }
            
            .frame(width: .widthPer(per: 0.98), height: .widthPer(per: 0.65))
            .padding(.top, 15)
            .ignoresSafeArea()
            .background(
                LinearGradient(gradient: Gradient(colors: [.colorGrey, .colorGray]), startPoint: .top, endPoint: .bottom))
        }
        .overlay {
            
            RoundedRectangle(cornerRadius:  10)
                .stroke( Color(appTint), lineWidth: 4)
        }
        .overlay {
            if showFilterView {
                DateFilterView(start: startDate, end: endDate, onSubmit: { start, end in
                    startDate = start
                    endDate = end
                    showFilterView = false
                }, onClose: {
                    showFilterView = false
                })
                .transition(.move(edge: .leading))
            }
        }
        .animation(.snappy, value: showFilterView)
    }
}
#Preview {
    ScrollView {
        ScoreCardView(income: 4590, expense: 2389)
    }
}
