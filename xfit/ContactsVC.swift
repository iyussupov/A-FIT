//
//  ContactsVC.swift
//  xfit
//
//  Created by Dev1 on 3/11/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit
import MapKit

class ContactsVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var contentField: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var MapViewLocationManager:CLLocationManager! = CLLocationManager()
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        self.evo_drawerController?.openDrawerGestureModeMask = .All
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        
        if let contentString = self.contentField.text {
            
            let attrString = NSMutableAttributedString(string: contentString)
            attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
            self.contentField.attributedText = attrString
            
        }
        
        mapView.delegate = self
        
        // set initial location in (55.783541, 37.560335)
        let initialLocation = CLLocation(latitude: 51.5082085, longitude: -0.1410421)
        centerMapOnLocation(initialLocation)
        
        
        // show artwork on map
        let artwork = CustomAnnotation(identifier: "coords",title: "A-FIT", coordinate: CLLocationCoordinate2D(latitude: 51.5082085, longitude: -0.1410421))
        mapView.addAnnotation(artwork)
        
        
    }
    
    let regionRadius: CLLocationDistance = 100
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identifier = "pin"
        
        if annotation.isKindOfClass(MKUserLocation) {
            return nil
        }
        
        // Reuse the annotation if possible
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
        
        if annotationView == nil
        {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            annotationView!.canShowCallout = true
            annotationView!.image = UIImage(named: "xfitmapicon.png")
        }
        else
        {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    @IBAction func openMenu(sender: AnyObject) {
        self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
        
    }
    
    @IBAction func openProfile(sender: AnyObject) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}


class CustomAnnotation: NSObject, MKAnnotation {
    private var _identifier : String?
    private var _title: String?
    private var _coordinate: CLLocationCoordinate2D
    
    var identifier : String? {
        return _identifier
    }
    
    var title: String? {
        return _title
    }
    
    var coordinate: CLLocationCoordinate2D {
        return _coordinate
    }
    
    
    init(identifier: String, title: String, coordinate: CLLocationCoordinate2D)
    {
        self._identifier = identifier
        self._title = title
        self._coordinate = coordinate
        
        super.init()
    }
}