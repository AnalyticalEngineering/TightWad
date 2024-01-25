//
//  SegmentButton.swift
//  TightWad
//
//  Created by J. DeWeese on 1/24/24.
//

import SwiftUI

struct SegmentButton: View {
    @State var segmentTitle: String = "Title"
    var isActive: Bool = false
    var onPressed: ( ()->())?
    
    var body: some View {
        Button {
            onPressed?()
        } label: {
            Text(segmentTitle)
                .font(.customfont(.semibold, fontSize: 15))
        }
        .foregroundColor( isActive ? .white : .primary )
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 42, maxHeight: 42)
        
        .background(Color.gray.opacity( isActive ? 0.1 : 0.0 ))
        .overlay {
            RoundedRectangle(cornerRadius:  12)
                .stroke( isActive ? Color.titanium: .clear, lineWidth: 4)
        }
        .background(Color.titanium)
        .cornerRadius(12)
    }
}
#Preview {
    SegmentButton()
}
