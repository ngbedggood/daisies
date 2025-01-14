//
//  Untitled.swift
//  Daisies
//
//  Created by Nathaniel Bedggood on 14/01/2025.
//

import SwiftUI

struct DDD: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            
            let offset: CGFloat = 5
            
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(.buttonColorSecondary)
                .offset(y: offset)
            
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(.button)
                .offset(y: configuration.isPressed ? offset: 0)
            
            configuration.label
                .offset(y: configuration.isPressed ? offset : 0)
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("Test") {
            
        }
        .foregroundColor(.white)
        .frame(width: 50, height: 50)
        .buttonStyle(DDD())
        
    }
}
