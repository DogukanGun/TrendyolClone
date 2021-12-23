//
//  SelfServicePlaceTableViewCell.swift
//  TrendyolClone
//
//  Created by Dogukan Gundogan on 12/24/21.
//

import UIKit

class SelfServicePlaceTableViewCell: UITableViewCell {

    @IBOutlet weak var wrapper: UIView!
    @IBOutlet weak var selfServicePlaceName: UILabel!
    @IBOutlet weak var closedImage: UIImageView!
    @IBOutlet weak var selfServicePlaceImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
    }
    
    func refresh(selfServicePlace:SelfServicePlace){
        if let placeName = selfServicePlace.placeName, let placeImageName = selfServicePlace.placeImageName, let image = UIImage(named: placeImageName), let isClosed = selfServicePlace.isClosed{ 
            selfServicePlaceName.text = placeName
            selfServicePlaceImage.image = image
            if !isClosed{
                closedImage.layer.opacity = 0
            }
        }
    }
}
