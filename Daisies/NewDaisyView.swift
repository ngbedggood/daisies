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
    
    // temp proto
    var testFriends = ["Tinky-Winky", "Dipsy", "Laa Laa", "Po"]
    @State private var selectedFriend: String = "Tinky-Winky"
    
    var body: some View {
        HStack {
            Text("Plant a daisy for ")
                .font(.title)
            // Will need to customise this
            Picker("Friends", selection: $selectedFriend) {
                ForEach(testFriends, id: \.self) { friend in
                    Text(friend)
                }
            }
        }
        Form {
            TextField("Write a message here...", text: $newLocation.message, axis: .vertical)
                .lineLimit(8, reservesSpace: true)
                .textFieldStyle(.plain)
                .submitLabel(.return)
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
        Button("Plant Daisy") {
            //$locations.append(newLocation)
            locations.append(newLocation)
            dismiss()
        }
        .buttonStyle(DDD())
        .frame(width: 160, height: 60)
        .font(.title2)
        .fontWeight(.bold)
    }
}

#Preview {
    let testLocations = [
        Location(id: UUID(), name: "test", message: "Hi", latitude: 43.0, longitude: -92.5),
    ]
    NewDaisyView(newLocation: .constant(testLocations[0]), locations: .constant(testLocations))
}
