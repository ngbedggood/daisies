//
//  ContentView.swift
//  Daisies
//
//  Created by Nathaniel Bedggood on 05/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MapView()
                .tabItem {
                    Label("Map", systemImage: "globe")
                }
            FriendsView()
                .tabItem {
                    Label("Friends", systemImage: "person.3.fill")
                }
            MessagesView()
                .tabItem {
                    Label("Messages", systemImage: "camera.macro")
                }
        }
    }
}

#Preview {
    ContentView()
}
