//
//  FriendsView.swift
//  Daisies
//
//  Created by Nathaniel Bedggood on 05/01/2025.
//

import SwiftUI

struct FriendsView: View {
    
    @State private var friendEmail: String = ""
    
    var body: some View {
        VStack {
            TextField("Search friend", text: $friendEmail)
                .autocapitalization(.none)
                .autocorrectionDisabled()
                .frame(height: 22)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.inputBorder, lineWidth: 2)
                )
                .padding()
            List {
                Text("Tinky-Winky")
                Text("Dipsy")
                Text("Laa Laa")
                Text("Po")
            }
        }
    }
}

#Preview {
    FriendsView()
}
