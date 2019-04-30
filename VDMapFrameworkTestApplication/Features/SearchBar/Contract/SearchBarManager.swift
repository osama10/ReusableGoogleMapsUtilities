//
//  SearchBarManager.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 30/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
import UIKit
import GooglePlaces

protocol SearchBarManagerDelegate : class{
    func searchSuccessful(result : GMSPlace)
    func searchFailedWithError(error : Error)
    func searchCancelled()
}

protocol SearchBarManager :  GMSAutocompleteViewControllerDelegate{
    
    var viewController : UIViewController!{ get }
    var delegate : SearchBarManagerDelegate?{ get }
    
    init(viewController : UIViewController, delegate :  SearchBarManagerDelegate)
    
    func showSearchViewController()
}
