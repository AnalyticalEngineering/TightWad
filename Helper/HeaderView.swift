//
//  HeaderView.swift
//  TightWad
//
//  Created by J. DeWeese on 1/23/24.
//

import SwiftUI
import SwiftData

struct HeaderView: View {
    /// User Properties
    @AppStorage("userName") private var userName: String = " "
    @State private var openSideMenu: Bool = false
    @State  private var addTransaction: Bool = false
    @State private var searchText: String = " "
    
    var body: some View {
            HStack {
                Button(action: {
                    openSideMenu.toggle()
                    HapticManager.notification(type: .success)
                }) {
                    Image(systemName: "line.3.horizontal")
                        .foregroundStyle(.white)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(11)
                        .background(appTint.gradient, in: .circle)
                        .clipShape(Circle())
                }
               
                Spacer()
                Text("TightWad Tracker")
                    .font(.title2.bold())
                
                Spacer()
                
               Button(action: {
                   addTransaction.toggle()
                   HapticManager.notification(type: .success)
                }, label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.white)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(9)
                        .background(appTint.gradient, in: .circle)
                        .clipShape(Circle())
                })
            }
           .padding(.horizontal)
            .frame(width: .widthPer(per: 0.99), height: .widthPer(per: 0.01))
      
          
        
            
                .sheet(isPresented: $addTransaction) {
                    //MARK:  ADD EXPENSE VIEW
                    AddTransactionView()
                    //                .interactiveDismissDisabled()
                }
                .sheet(isPresented: $openSideMenu) {
                    //MARK:  ADD EXPENSE VIEW
                    SideMenu()
                    //                .interactiveDismissDisabled()
                }
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
    HeaderView()
}
