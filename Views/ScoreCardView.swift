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
    
    
    var body: some View {
        ZStack(alignment: .top){
            
            VStack(spacing: 0) {
                Text("Savings")
                    .font(.caption2)
                    .foregroundStyle(Color(.colorGrey))
                    .padding(5)
                HStack(spacing: 12) {
                    Text("\(currencyString(income - expense))")
                        .font(.headline.bold())
                    
                    Image(systemName: expense > income ? "chart.line.downtrend.xyaxis" : "chart.line.uptrend.xyaxis")
                        .font(.title3)
                        .foregroundStyle(expense > income ? .red : .green)
                }
                .padding(.bottom, 25)
                
                HStack(spacing: 0) {
                    ForEach(TransactionType.allCases, id: \.rawValue) { transactionType in
                        let symbolImage = transactionType == .income ? "arrow.down" : "arrow.up"
                        let tint = transactionType == .income ? Color.green : Color.red
                        
                        HStack(spacing: 10) {
                            Image(systemName: symbolImage)
                                .font(.callout.bold())
                                .foregroundStyle(.primary)
                                .frame(width: 35, height: 35)
                                .background {
                                    Circle()
                                        .fill(tint.opacity(0.25).gradient)
                                }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(transactionType.rawValue)
                                    .font(.caption2)
                                    .foregroundStyle(Color(.colorGrey))
                                
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
                }
                .frame(width: .widthPer(per: 0.94), height: .widthPer(per: 0.1))
                .overlay {
                   
                    ArcShape()
                        .stroke( Color(.colorOrange), lineWidth: 2)
                        .frame(width: .widthPer(per: 0.43))
                        .offset(x: 1)
                        .offset(y: -30)
                }
            }
            .frame(width: .widthPer(per: 0.98), height: .widthPer(per: 0.6))
            .padding(.top, 15)
            .ignoresSafeArea()
            .background(Color(.colorBackground))
        }
        .overlay {
            RoundedRectangle(cornerRadius:  10)
                .stroke( Color(.colorOrange), lineWidth: 4)
            
        }
    }
}
#Preview {
    ScrollView {
        ScoreCardView(income: 4590, expense: 2389)
    }
}
