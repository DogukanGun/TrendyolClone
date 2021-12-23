//
//  SelfServicePlace.swift
//  TrendyolClone
//
//  Created by Dogukan Gundogan on 12/24/21.
//

import Foundation

class SelfServicePlace{
    var placeName:String?
    var placeImageName:String?
    var isClosed:Bool?
    
    init(){}
    
    init(placeName:String,placeImageName:String,isClosed:Bool){
        self.placeName = placeName
        self.placeImageName = placeImageName
        self.isClosed = isClosed
    }
}
