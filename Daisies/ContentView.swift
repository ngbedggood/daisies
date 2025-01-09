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
    
    @State private var startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 43, longitude: -93),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )
    
    @State private var locations : [Location] = []
    
    
    var body: some View {
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
            MessagesView()
                .tabItem {
                    Label("Messages", systemImage: "camera.macro")
                }
        }
        //.padding()
    }
}

#Preview {
    ContentView()
}
