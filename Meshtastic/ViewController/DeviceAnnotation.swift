//
//  DeviceAnnotation.swift
//  Meshtastic
//
//  Created by Joshua Pirihi on 7/08/21.
//

import UIKit
import MapKit

class DeviceAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    var title: String?
    var subtitle: String?
    
    var colour: UIColor = UIColor.systemRed
    
    init(nodeInfo: NodeInfo) {
        self.coordinate = CLLocationCoordinate2D(latitude: Double(nodeInfo.position.latitudeI)*1e-7, longitude: Double(nodeInfo.position.longitudeI)*1e-7)
        self.title = nodeInfo.user.longName
        self.subtitle = ""
        
    }
    
}
