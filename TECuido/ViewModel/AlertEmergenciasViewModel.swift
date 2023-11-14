//
//  AlertEmergenciasViewModel.swift
//  TECuido
//
//  Created by Alumno on 08/11/23.
//

import Foundation
import MapKit
import CoreLocation
import _MapKit_SwiftUI

struct Marker: Identifiable {
    let id = UUID()
    var location: MapMarker
}

class AlertEmergenciasViewModel: ObservableObject {
    @Published var region = MKCoordinateRegion(
        center:  CLLocationCoordinate2D(
          latitude: 37.789467,
          longitude:-122.416772
        ),
        span: MKCoordinateSpan(
          latitudeDelta: 0.2,
          longitudeDelta: 0.2
       )
    )
    
    @Published var markers = [Marker(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: 38.8977, longitude: -77.0365), tint: .red))]

    
    func updateCoordinates(latitude: Float, longitude: Float){
        region.center = CLLocationCoordinate2D(
            latitude: Double(latitude),
            longitude: Double(longitude)
        )
        markers = [Marker(
            location: MapMarker(
                coordinate: CLLocationCoordinate2D(
                    latitude: Double(latitude),
                    longitude: Double(longitude)
                ),
                tint: .red
            )
        )]
    }
    
    
    
}
