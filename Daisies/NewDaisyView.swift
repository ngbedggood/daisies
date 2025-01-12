//
//  NewDaisyView.swift
//  Daisies
//
//  Created by Nathaniel Bedggood on 09/01/2025.
//

import SwiftUI

struct NewDaisyView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var newLocation: Location
    @Binding var locations: [Location]
    
    var body: some View {
            Form {
                TextField("Write a message here...", text: $newLocation.message, axis: .vertical)
                    .lineLimit(10, reservesSpace: true)
                    .textFieldStyle(.plain)
                    .submitLabel(.return)
                Button("Plant Daisy") {
                    //$locations.append(newLocation)
                    locations.append(newLocation)
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
                .controlSize(.large)
                .font(.title2)
                .fontWeight(.bold)
            }
            .navigationTitle("Plant a daisy for your \(newLocation.name)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
    }
}

#Preview {
    let testLocations = [
        Location(id: UUID(), name: "test", message: "Hi", latitude: 43.0, longitude: -92.5),
    ]
    NewDaisyView(newLocation: .constant(testLocations[0]), locations: .constant(testLocations))
}
