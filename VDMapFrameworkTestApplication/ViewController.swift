//
//  ViewController.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 09/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    @IBOutlet weak var mapView : GMSMapView!
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var etaLabel: UILabel!
    var routing : Routing!
    override func viewDidLoad() {
        super.viewDidLoad()
        routing = RoutingImp(mapView: self.mapView)
        self.createRoute()
        self.getETAAndDistance()
    }

    private func createRoute(){
        let origin = CLLocationCoordinate2D(latitude: 24.9207, longitude: 67.0882)
        let destination = CLLocationCoordinate2D(latitude: 24.9204, longitude: 67.1344)
        
        let routeInfo = RouteInfoDTO(origin : origin, destination : destination , key : googleMapsApiKey, mode: .driving, alternatives: .no)//, mode: .driving, alternatives: true )
        
        let originMarker = GMSMarker(position: origin)
        
        let destinationMarker = GMSMarker(position: destination)
        
        originMarker.map = self.mapView
        destinationMarker.map = self.mapView
        
        self.mapView.camera = GMSCameraPosition.camera(withTarget: origin, zoom: 16.0)
        
        routing.createPath(routingInfoDTO: routeInfo) { [weak self](response) in
            guard let self = self else { return }

            switch response{
            case .success(let data):
                print(data.status)
            case .failure(let errorMessage):
                self.distanceLabel.text   = "DIRECTION ERROR \(errorMessage)"
            }
        }
    }
    
    private func getETAAndDistance(){
        let origin = CLLocationCoordinate2D(latitude: 24.9207, longitude: 67.0882)
        let destination = CLLocationCoordinate2D(latitude: 24.9204, longitude: 67.1344)
        
        let routeInfo = RouteInfoDTO(origin : origin, destination : destination , key : googleMapsApiKey, mode: .driving, alternatives: .no)
        self.routing.getTimeAndDistance(routingInfoDTO: routeInfo) { [weak self](response) in
            guard let self = self else { return }

            switch response{
            case .success(let data):
                self.distanceLabel.text = "Distance \(data.distance) meters"
                self.etaLabel.text = "ETA \(data.eta) seconds"
            case .failure(let errorMessage):
                self.etaLabel.text = "DISTANCE ETA ERROR \(errorMessage)"
            }
        }
    }

}

