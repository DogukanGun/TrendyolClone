//
//  SelfService.swift
//  TrendyolClone
//
//  Created by Dogukan Gundogan on 12/23/21.
//

import Foundation


class SelfService{
    var serviceType:String?
    var serviceImageName:String?
    
    init(){}
    
    init(serviceType:String,serviceImageName:String){
        self.serviceType = serviceType
        self.serviceImageName = serviceImageName
    }
}
