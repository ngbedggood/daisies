//
//  ContentView.swift
//  Daisies
//
//  Created by Nathaniel Bedggood on 05/01/2025.
//

import SwiftUI
import MapKit
import FirebaseAuth


struct ContentView: View {
    
    @State var locationManager = LocationManager()
    @State var authManager = AuthManager()
    
    @State private var startPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var locations : [Location] = []
    
    var body: some View {
        if authManager.isSignedIn {
          // User is signed in:
            TabView {
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
        } else {
            LoginView()
                .environment(authManager)
        }
    }
}

#Preview {
    ContentView()
}
