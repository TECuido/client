//
//  MapaNavModel.swift
//  TECuido
//
//  Created by Alumno on 15/01/24.
//

import SwiftUI
import MapKit
import Foundation

struct MapaNavModel: Hashable {
    @Binding var region: MKCoordinateRegion
    @Binding var markers: [Marker]

    static func == (lhs: MapaNavModel, rhs: MapaNavModel) -> Bool {
        let positionEqual = lhs.region.center.latitude == rhs.region.center.latitude
        && lhs.region.center.longitude == rhs.region.center.longitude
        if(!positionEqual){
            return false
        }
        for (m1, m2) in zip(lhs.markers, rhs.markers) {
            if m1.id != m2.id {
                return false
            }
        }
        return true
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(region.center.latitude)
        hasher.combine(region.center.longitude)
        for marker in markers {
            hasher.combine(marker.id)
        }
    }
    
    func getRegion() -> Binding<MKCoordinateRegion>{
        return _region
    }
    
    func getMarkers() -> Binding<[Marker]>{
        return _markers
    }
}
