//
//  MapViewController.swift
//  Meshtastic
//
//  Created by Joshua Pirihi on 7/08/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MasterViewController.shared.mapVC = self
        
        // Do any additional setup after loading the view.
        self.mapView.mapType = .hybrid
        self.mapView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.visibleViewController?.title = "Map"
        self.displayNodes()
    }
    
    func displayNodes() {
        self.mapView.removeAnnotations(self.mapView.annotations)
        for node in DataBase.shared.nodeArray {
            let annotation = DeviceAnnotation(nodeInfo: node)
            self.mapView.addAnnotation(annotation)
        }
        if let myNode = NodeInfo_DP().getMyNodeObject() {
            let myAnnotation = DeviceAnnotation(nodeInfo: myNode)
            myAnnotation.colour = UIColor.systemBlue
            self.mapView.addAnnotation(myAnnotation)
        }
        
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let deviceAnnotation = annotation as? DeviceAnnotation {
            let v = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: nil)
            v.markerTintColor = deviceAnnotation.colour
            return v
        }
        
        return nil
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
