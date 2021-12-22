//
//  SelfServiceCollectionViewCell.swift
//  TrendyolClone
//
//  Created by Dogukan Gundogan on 12/23/21.
//

import UIKit

class SelfServiceCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var serviceImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func refresh(selfService:SelfService){
        if let imageName = selfService.serviceImageName, let image = UIImage(named: imageName){
            serviceImage.image = image
        }
    }

}
