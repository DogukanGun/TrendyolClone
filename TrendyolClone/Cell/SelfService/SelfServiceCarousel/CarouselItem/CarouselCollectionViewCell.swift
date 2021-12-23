//
//  CarouselCollectionViewCell.swift
//  TrendyolClone
//
//  Created by Dogukan Gundogan on 12/24/21.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var carouselImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func refresh(imageName:String){
        if let image = UIImage(named: imageName){
            carouselImage.image = image
        }
    }

}
