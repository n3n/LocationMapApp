//
//  Treasure.swift
//  LocationMap
//
//  Created by Nonpawit Teerachetmongkol on 11/18/2558 BE.
//  Copyright © 2558 Nonpawit Teerachetmongkol. All rights reserved.
//

import Foundation
import MapKit

class Treasure: NSObject{
    let name: String
    let location: GeoLocation
    
    init(name: String, location: GeoLocation) {
        self.name = name
        self.location = location
    }
    
    convenience init(name: String, latitude: Double, longitude: Double) {
        let location = GeoLocation(latitude: latitude, longitude: longitude)
        self.init(name: name, location: location)
    }
}

extension Treasure: MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        return self.location.coordinate
    }
    
    var title: String? {
        return self.name
    }
    
}