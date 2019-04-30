//
//  CameraManagerImp.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 23/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
import CoreLocation
import GoogleMaps

class CameraManagerImp : CameraManager{

    let mapView : GMSMapView
    
    init(mapView : GMSMapView) {
        self.mapView = mapView
    }
    
    func setCamera(withTarget target: CLLocationCoordinate2D, zoom: Float) {
        let camera = GMSCameraPosition.camera(withTarget: target, zoom: zoom)
        mapView.camera = camera
    }
    
    func setCamera(withTarget target: CLLocationCoordinate2D, zoom: Float, bearing: CLLocationDirection, viewingAngle: Double) {
        let camera = GMSCameraPosition.camera(withTarget: target, zoom: zoom, bearing: bearing, viewingAngle: viewingAngle)
        mapView.camera = camera
    }
    
    func setCamera(withLatitude latitude: CLLocationDegrees, longitude: CLLocationDegrees, zoom: Float) {
        let camera  = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: zoom)
        mapView.camera = camera
        
    }
    
    func setCamera(withLatitude latitude: CLLocationDegrees, longitude: CLLocationDegrees, zoom: Float, bearing: CLLocationDirection, viewingAngle: Double) {
        let camera  = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: zoom, bearing : bearing, viewingAngle : viewingAngle)
        mapView.camera = camera
    }

    func animateMap(toViewingAngle viewingAngle: Double) {
        mapView.animate(toViewingAngle: viewingAngle)
    }
    
    func animateMap(to cameraPositon: GMSCameraPosition) {
        mapView.animate(to: cameraPositon)
    }
    
    func animateMap(with cameraUpdate: GMSCameraUpdate) {
        mapView.animate(with: cameraUpdate)
    }
    
    func animateMap(toZoom zoom: Float) {
        mapView.animate(toZoom: zoom)
    }
    
    func animateMap(toBearing bearing: CLLocationDirection) {
        mapView.animate(toBearing: bearing)
    }
    
    func animateMap(toLocation location: CLLocationCoordinate2D) {
        mapView.animate(toLocation: location)
    }
    
    func setMinZoom(minZoom: Float, maxZoom: Float)throws{
        if(minZoom < maxZoom){
            mapView.setMinZoom(minZoom, maxZoom: maxZoom)
        }else{
            throw MapFrameworkException.minZoomGreaterThanMaxZoom("MinZoom must be less than MaxZoom ")
        }
    }
    
    func moveCamera(toBounds bounds: GMSCoordinateBounds) {
        let update = GMSCameraUpdate.fit(bounds)
        mapView.moveCamera(update)
        
    }
    
    func moveCamera(toBounds bounds: GMSCoordinateBounds, withPadding padding: CGFloat) {
        let update = GMSCameraUpdate.fit(bounds, withPadding: padding)
        mapView.moveCamera(update)
    }
    
    func moveCamera(toBounds bounds: GMSCoordinateBounds, withEdgeInsets edgeInsets: UIEdgeInsets) {
        let update = GMSCameraUpdate.fit(bounds, with: edgeInsets)
        mapView.moveCamera(update)
    }
}

