//
//  MapaView.swift
//  TECuido
//
//  Created by Alumno on 08/11/23.
//

import MapKit
import SwiftUI

struct MapaView: View {
    
    @Binding var region: MKCoordinateRegion
    @Binding var markers: [Marker]
    @State var tracking:MapUserTrackingMode = .follow
    
    
    var body: some View {
        VStack {
            Map(
                coordinateRegion: $region,
                interactionModes: MapInteractionModes.all,
                showsUserLocation: true,
                userTrackingMode: $tracking,
                annotationItems: markers
            ) { marker in
                marker.location
            }
            .edgesIgnoringSafeArea(.all)
        }

    }
}


