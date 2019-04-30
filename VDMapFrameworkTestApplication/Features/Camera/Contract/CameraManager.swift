//
//  CameraManager.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 23/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
import CoreLocation
import GoogleMaps

protocol CameraManager {
    
    func setCamera(withTarget target: CLLocationCoordinate2D, zoom : Float)
    func setCamera(withTarget target: CLLocationCoordinate2D, zoom : Float, bearing : CLLocationDirection, viewingAngle : Double)
    func setCamera(withLatitude latitude: CLLocationDegrees, longitude : CLLocationDegrees, zoom : Float)
    func setCamera(withLatitude latitude: CLLocationDegrees, longitude : CLLocationDegrees, zoom : Float, bearing : CLLocationDirection, viewingAngle : Double)
    
    func animateMap(toViewingAngle viewingAngle: Double)
    func animateMap(to cameraPositon: GMSCameraPosition)
    func animateMap(with cameraUpdate : GMSCameraUpdate)
    func animateMap(toZoom zoom : Float)
    func animateMap(toBearing bearing : CLLocationDirection)
    func animateMap(toLocation location : CLLocationCoordinate2D)
    
    func setMinZoom(minZoom : Float, maxZoom: Float)throws
    
    func moveCamera(toBounds bounds: GMSCoordinateBounds)
    func moveCamera(toBounds bounds: GMSCoordinateBounds, withPadding padding : CGFloat)
    func moveCamera(toBounds bounds: GMSCoordinateBounds, withEdgeInsets edgeInsets : UIEdgeInsets)
}
