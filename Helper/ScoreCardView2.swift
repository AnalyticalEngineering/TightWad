//
//  ScoreCardView2.swift
//  TightWad
//
//  Created by J. DeWeese on 1/25/24.
//

import SwiftUI

struct ScoreCardView2: View {
    var body: some View {
        ScrollView {
            
            ZStack(alignment: .center) {
                
                Rectangle()
                    .foregroundColor(.colorBackground.opacity(0.5))
                    .frame(width: .screenWidth-4, height: .widthPer(per: 1.0) )
                    .cornerRadius(25)
                
                
                Image("home_bg")
                    .resizable()
                    .scaledToFit()
                
                ZStack{
                    ArcShape()
                        .foregroundColor(Color.colorGrey.opacity(0.2))
                    
                    ArcShape(start: 0, end: 230)
                        .foregroundColor(Color.colorGreen)
                        .shadow( color: Color.colorGreen, radius: 4)
                }
                .frame(width: .widthPer(per: 0.72), height: .widthPer(per: 0.72) )
                .padding(.bottom, 18)
                
                VStack(spacing: .widthPer(per: 0.07)){
                    Image("app_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: .widthPer(per: 0.25) )
                    
                    Text("$1,235")
                        .font(.customfont(.bold, fontSize: 40))
                        .foregroundColor(.primary)
                    
                    Text("Savings")//TODO: CREATE ACTUAL DATE PERIOD
                        .font(.customfont(.semibold, fontSize: 12))
                        .foregroundColor(.colorGrey)
                }
            }
        }
    }
}

#Preview {
    ScoreCardView2()
}
