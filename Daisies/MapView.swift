//
//  MapView.swift
//  Daisies
//
//  Created by Nathaniel Bedggood on 05/01/2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @Environment(LocationManager.self) private var lm
    
    @Binding var startPosition: MapCameraPosition
    @Binding var locations: [Location]
    
    @State private var newLocation: Location = Location(
        id: UUID(),
        name: "test name",
        message: "test name",
        latitude: 21.0,
        longitude: 69.0
    )
    
    @State private var isShowingSheet = false
    
    var body: some View {
        VStack {
            Text("Your location is \(lm.location?.coordinate.latitude ?? 0.0) \(lm.location?.coordinate.longitude ?? 0.0)")
            MapReader { proxy in
                Map(initialPosition: startPosition) {
                    ForEach(locations) { location in
                        Annotation(location.name, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                                Image("marker")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .animation(.easeInOut(duration: 1.5), value: startPosition)
                        }
                    }
                }
                .sheet(isPresented: $isShowingSheet) {
                    NavigationStack {
                        NewDaisyView(newLocation: $newLocation, locations: $locations)
                    }
                    .presentationDetents([.medium])
                    .interactiveDismissDisabled()
                }
                .mapControls {
                    MapUserLocationButton()
                }
                .mapStyle(.standard)
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        //print("Tapped at \(coordinate)")
                        newLocation = Location(
                            id: UUID(),
                            name: "friend_name",
                            message: "",
                            latitude: coordinate.latitude,
                            longitude: coordinate.longitude
                        )
                        isShowingSheet = true
                    }
                }
            }
            Button("Clear") {
                locations = []
            }
            .padding()
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    let testPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 43.6, longitude: -93),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        ))

    let testLocations = [
        Location(id: UUID(), name: "test", message: "Hi there", latitude: 43.0, longitude: -92.5),
    ]
    MapView(startPosition: .constant(testPosition), locations: .constant(testLocations))
}
