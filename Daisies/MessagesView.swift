//
//  MessagesView.swift
//  Daisies
//
//  Created by Nathaniel Bedggood on 05/01/2025.
//

import SwiftUI

struct MessagesView: View {
    
    @Binding var locations: [Location]
    
    var body: some View {
        List {
            ForEach(locations) { location in
                VStack{
                    Text("\(location.message) - \(location.name)")
                }
            }
        }
    }
}

#Preview {
    let testLocations = [
        Location(id: UUID(), name: "test", message: "Hi there", latitude: 43.0, longitude: -92.5),
    ]
    MessagesView(locations: .constant(testLocations))
}
