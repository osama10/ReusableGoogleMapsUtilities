//
//  ViewController.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 09/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class ViewController: UIViewController {

    @IBOutlet weak var mapView : GMSMapView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var etaLabel: UILabel!
    
    var routing : Routing!
    var trafficMonitoring : TrafficMonitoring!
    var stylingManager : MapStyle!
    var searchBarManager : SearchBarManager!
    var mapStyle : MapStyle!
    var cameraManager : CameraManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.routing = RoutingImp(mapView: self.mapView)
        self.trafficMonitoring = TrafficMonitoringImp(mapView: self.mapView)
        self.stylingManager = MapStyleImp(mapView: self.mapView)
        
        self.mapStyle = MapStyleImp(mapView: self.mapView)
        cameraManager = CameraManagerImp(mapView: mapView)
        searchBarManager = SearchBarManagerImp(viewController: self, delegate: self)
        self.createRoute()
        self.getETAAndDistance()
        setCamera()
    }
    
    private func setCamera(){
        let origin = CLLocationCoordinate2D(latitude: 24.9207, longitude: 67.0882)
        
        cameraManager.setCamera(withTarget: origin, zoom: 16.0)
        
    }

    private func createRoute(){
        let origin = CLLocationCoordinate2D(latitude: 24.9207, longitude: 67.0882)
        let destination = CLLocationCoordinate2D(latitude: 24.9204, longitude: 67.1344)
        
        let routeInfo = RouteInfoDTO(origin : origin, destination : destination , key : googleMapsApiKey, mode: .driving, alternatives: .yes)//, mode: .driving, alternatives: true )
        
        let originMarker = GMSMarker(position: origin)
        
        let destinationMarker = GMSMarker(position: destination)
        
        originMarker.map = self.mapView
        destinationMarker.map = self.mapView
        
        
        routing.createPath(routingInfoDTO: routeInfo) { [weak self](response) in
            guard let self = self else { return }

            switch response{
            case .success(let data):
                print(data.status ?? "success")
            case .failure(let errorMessage):
                self.distanceLabel.text   = "DIRECTION ERROR \(errorMessage)"
            }
        }
    }
    
    private func getETAAndDistance(){
        let origin = CLLocationCoordinate2D(latitude: 24.9207, longitude: 67.0882)
        let destination = CLLocationCoordinate2D(latitude: 24.9204, longitude: 67.1344)
        
        let routeInfo = RouteInfoDTO(origin : origin, destination : destination , key : googleMapsApiKey, mode: .driving, alternatives: .no)
        self.routing.getDistanceData(routingInfoDTO: routeInfo) { [weak self](response) in
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
 
    @IBAction func didTapOnTrafficeEnableSwitch(_ sender: UISwitch) {
        self.trafficMonitoring.isTrafficEnabled = sender.isOn
    
    }
    
    @IBAction func didTapOnMapTypeButton(_ sender: UIButton) {
        
        let type = sender.tag
        
        switch type{
        case 0:
            self.mapStyle.mapType = .normal
            //self.mapView.animate(toViewingAngle: 0)

        case 1:
            self.mapStyle.mapType = .none
            //self.mapView.animate(toViewingAngle: 45)

        case 2:
            self.mapStyle.mapType = .hybrid
            //self.mapView.animate(toViewingAngle: 90)

        case 3:
            self.mapStyle.mapType = .satellite
            //self.mapView.animate(toViewingAngle: 135)

        case 4:
            self.mapStyle.mapType = .terrain
            //self.mapView.animate(toViewingAngle: 180)

        default:
            searchBarManager.showSearchViewController()
            print("nae hai kuch")
            
        }
        

    }
}

extension ViewController : SearchBarManagerDelegate{
    func searchSuccessful(result: GMSPlace) {
        print(result.name)
    }
    
    func searchFailedWithError(error: Error) {
        print(error.localizedDescription)
    }
    
    func searchCancelled() {
        print("cancelled")
    }
    
    
}
