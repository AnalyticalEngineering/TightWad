//
//  View+Extensions.swift
//  TightWad
//
//  Created by J. DeWeese on 1/23/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func hSpacing(_ alignment: Alignment = .center) -> some View {
        self
        .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment = .center) -> some View {
        self
        .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    @available(iOSApplicationExtension, unavailable)
    var safeArea: UIEdgeInsets {
        if let windowScene = (UIApplication.shared.connectedScenes.first as? UIWindowScene) {
            return windowScene.keyWindow?.safeAreaInsets ?? .zero
        }
        
        return .zero
    }
    
    func format(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    func currencyString(_ value: Double, allowedDigits: Int = 2) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = allowedDigits
        
        return formatter.string(from: .init(value: value)) ?? ""
    }
    
    var currencySymbol: String {
        let locale = Locale.current
        
        return locale.currencySymbol ?? ""
    }
    
    func total(_ transactions: [Transaction], transactionType: TransactionType) -> Double {
        return transactions.lazy.filter({ $0.transactionType == transactionType.rawValue }).lazy.reduce(Double.zero) { partialResult, transaction in
            return partialResult + transaction.amount
        }
    }
    
    var appTint: Color {
        return Constants.shared.tintColor
    }
    
}
enum Inter: String {
    case regular = "Inter-Regular"
    case medium = "Inter-Medium"
    case semibold = "Inter-SemiBold"
    case bold = "Inter-Bold"
}

extension Font {
    
    static func customfont(_ font: Inter, fontSize: CGFloat) -> Font {
        custom(font.rawValue, size: fontSize)
    }
}
extension CGFloat {
    
    static var screenWidth: Double {
        return UIScreen.main.bounds.size.width
    }
    
    static var screenHeight: Double {
        return UIScreen.main.bounds.size.height
    }
    
    static func widthPer(per: Double) -> Double {
        return screenWidth * per
    }
    
    static func heightPer(per: Double) -> Double {
        return screenHeight * per
    }
}
