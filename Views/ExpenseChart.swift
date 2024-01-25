//
//  ExpenseChart.swift
//  TightWad
//
//  Created by J. DeWeese on 1/24/24.
//

import SwiftUI

struct ExpenseChart: View {
    var body: some View {
        VStack(alignment: .center) {
          
            ZStack{
                ArcShape()
                    .foregroundColor(.white.opacity(0.6))
                
                ArcShape(start: 0, end: 230)
                    .foregroundColor(.colorGreen)
                    .shadow( color: .colorGrey.opacity(0.5) , radius: 7)
                
                
                    .overlay {
                        ArcShape()
                            .stroke( Color.black, lineWidth: 1)
                    }
                
            }.padding(.horizontal)
            
            VStack(spacing: 0){
                
                Text("$1,235")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .fontDesign(.rounded)
                    .foregroundColor(.white)
                    .frame(width: .widthPer(per: 0.3), height: .widthPer(per: 0.5) )
                Text("Total Expenditures")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
              
            }
            .frame(width: .widthPer(per: 0.4), height: .widthPer(per: 0.0) )
        }
        .frame(width: .widthPer(per: 0.8), height: .widthPer(per: 0.2) )
        
    }
       
}

#Preview {
    ExpenseChart()
}
