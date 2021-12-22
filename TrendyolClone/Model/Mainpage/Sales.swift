//
//  Sales.swift
//  TrendyolClone
//
//  Created by Dogukan Gundogan on 12/22/21.
//

import Foundation

class Sale{
    var imageName:String?
    var category:String?
    
    init(){}
    
    init(imageName:String,category:String){
        self.imageName = imageName
        self.category = category
    }
}
