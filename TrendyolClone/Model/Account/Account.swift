//
//  Account.swift
//  TrendyolClone
//
//  Created by Dogukan Gundogan on 12/23/21.
//

import Foundation


class Account{
    var accountTypeImageName:String?
    var accountMenuName:String?
    var isAccountNew:Bool?
    
    
    init(){}
    
    init(accountTypeImageName:String,accountMenuName:String,isAccountNew:Bool){
        self.accountMenuName = accountMenuName
        self.accountTypeImageName = accountTypeImageName
        self.isAccountNew = isAccountNew
    }
}
