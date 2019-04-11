//
//  Extensions.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 10/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
import UIKit

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
