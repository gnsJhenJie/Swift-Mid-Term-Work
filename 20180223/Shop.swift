//
//  Shop.swift
//  20180223
//
//  Created by student on 2018/4/20.
//  Copyright © 2018年 TNFSH104. All rights reserved.
//

import Foundation
import UIKit
class Shop: NSObject{
    var name: String
    var adress: String
    var phoneNumber: String
    var shopImage: UIImage
    var caImage: UIImage
    init(name: String, adress: String, phoneNumber: String, shopImage: UIImage, caImage: UIImage) {
        self.name = name
        self.adress = adress
        self.phoneNumber = phoneNumber
        self.shopImage = shopImage
        self.caImage = caImage
    }
}
