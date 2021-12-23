//
//  Product.swift
//  TrendyolClone
//
//  Created by Dogukan Gundogan on 12/23/21.
//

import Foundation


class Product{
    var productName:String?
    var productImageName:String?
    var productPrice:String?
    
    init(){}
    
    init(productName:String,productImageName:String,productPrice:String){
        self.productName = productName
        self.productImageName = productImageName
        self.productPrice = productPrice
    }
}
