//
//  SelfServicePlace.swift
//  TrendyolClone
//
//  Created by Dogukan Gundogan on 12/24/21.
//

import Foundation
import UIKit

struct SelfServicePlaceVariable{
    struct CarouselCell{
        static let cellIdentifier = "SelfServiceCarouselTableViewCell"
        static let cellNibName = "SelfServiceCarouselTableViewCell"
    }
    struct PlaceCell{
        static let cellIdentifier = "SelfServicePlaceTableViewCell"
        static let cellNibName = "SelfServicePlaceTableViewCell"
    }
}

class SelfServicePlaceVC:UIViewController{
    
    var selfServicePlaces = [SelfServicePlace]()
    var selfServicePlaceNames = ["Köfteci Yusuf","Bizim Boşnak Börekçi","Can Can Kardeşler Pide"]
    override func viewDidLoad() {
        
    }
    
    
    private func createMockData(){
        for i in 1...4{
            let isClosed = i%2 == 0 ? true : false
            let selfServicePlace = SelfServicePlace(placeName: selfServicePlaceNames[i-1], placeImageName: "selfServicePlace\(i)", isClosed: isClosed)
            selfServicePlaces.append(selfServicePlace)
        }
    }
}


extension SelfServicePlaceVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selfServicePlaces.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            return tableView.dequeueReusableCell(withIdentifier: SelfServicePlaceVariable.CarouselCell.cellIdentifier, for: indexPath)
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: SelfServicePlaceVariable.PlaceCell.cellIdentifier, for: indexPath) as! SelfServicePlaceTableViewCell
            let item = selfServicePlaces[indexPath.row-1]
            cell.refresh(selfServicePlace: item)
            return cell
        }
    }
    
    
}
