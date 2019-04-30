//
//  SearchBarManagerImp.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 30/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
import UIKit
import GooglePlaces

class SearchBarManagerImp : NSObject,SearchBarManager{
    weak var viewController: UIViewController!
    weak var delegate: SearchBarManagerDelegate?
    
    required init(viewController: UIViewController, delegate: SearchBarManagerDelegate) {
        self.viewController = viewController
        self.delegate = delegate
    }
    
    func showSearchViewController() {
        createSearchBarView(viewController: self.viewController)
    }
    
    private func createSearchBarView(viewController : UIViewController){
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        
        let filter = GMSAutocompleteFilter()
        filter.type = .noFilter
        autocompleteController.autocompleteFilter = filter
        
        viewController.present(autocompleteController, animated: true, completion: nil)
    }
}

extension SearchBarManagerImp {
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        self.delegate?.searchSuccessful(result: place)
        self.viewController.dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        delegate?.searchFailedWithError(error: error)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        delegate?.searchCancelled()
        self.viewController.dismiss(animated: true, completion: nil)
        
    }
    
}


