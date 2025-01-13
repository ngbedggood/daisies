//
//  ContentView.swift
//  Daisies
//
//  Created by Nathaniel Bedggood on 05/01/2025.
//

import SwiftUI
import MapKit


struct ContentView: View {
    
    @State var locationManager = LocationManager()
    @State private var startPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var locations : [Location] = []
    
    var body: some View {
        TabView {
            LoginView()
                .tabItem {
                    Label("Log In", systemImage: "person.fill")
                }
            MapView(startPosition: $startPosition, locations: $locations)
                .environment(locationManager)
                .tabItem {
                    Label("Map", systemImage: "globe")
                }
            FriendsView()
                .tabItem {
                    Label("Friends", systemImage: "person.3.fill")
                }
            MessagesView(locations: $locations)
                .tabItem {
                    Label("Messages", systemImage: "camera.macro")
                }
        }
    }
}

#Preview {
    ContentView()
}
