//
//  ProductSaleCollectionViewCell.swift
//  TrendyolClone
//
//  Created by Dogukan Gundogan on 12/24/21.
//

import UIKit

class ProductSaleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productSaleImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func refresh(imageName:String){
        if let image = UIImage(named: imageName){
            productSaleImage.image = image
        }
    }

}
