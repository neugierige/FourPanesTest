//
//  ViewController.swift
//  FourPaneTest
//
//  Created by Luyuan Xing on 9/17/16.
//  Copyright © 2016 Luyuan Xing. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var containerView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webViewSetup()
        mapSetup()
    }

    
    func webViewSetup() {
        let urlString = "https://providenceathenaeum.org/"
        let url = NSURL(string: urlString)
        let request = NSMutableURLRequest(url: url as! URL)
        webView.loadRequest(request as URLRequest)
    }
    
    func mapSetup() {
        let latitude = 41.825792
        let longitude = -71.408572
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        annotation.title = "Providence Athenaum"
        mapView.addAnnotation(annotation)
        let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 1000, 1000)
        let adjustedRegion = mapView.regionThatFits(region)
        mapView.setRegion(adjustedRegion, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

