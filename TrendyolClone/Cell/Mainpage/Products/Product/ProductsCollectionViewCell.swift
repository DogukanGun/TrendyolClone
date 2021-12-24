//
//  ProductsCollectionViewCell.swift
//  TrendyolClone
//
//  Created by Dogukan Gundogan on 12/23/21.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var addBasketButton: UIButton!
    
    var product:Product?
    var cellDelegate:ProductsVCCellDelegate?
    var likeButtonFlag = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createButton()
    }

    private func createButton(){
        addBasketButton.layer.borderColor = UIColor.orange.cgColor
        addBasketButton.layer.borderWidth = CGFloat(2)
        addBasketButton.layer.cornerRadius = CGFloat(10)
        self.bringSubviewToFront(likeButton)
    }
    
    @IBAction func likeButtonPressed(_ sender: Any) {
        likeButtonFlag = !likeButtonFlag
        if likeButtonFlag{
            likeButton.imageView?.image = UIImage(systemName: "heart.fill")
        }else{
            likeButton.imageView?.image = UIImage(systemName: "heart")
        }
    }
    
    @IBAction func addBasketPressed(_ sender: Any) {
        if let product = product {
            cellDelegate?.productVCCellDelegate(product)
        }
    }
    
    
    func refresh(product:Product){
        if let productImageName = product.productImageName, let price = product.productPrice, let name = product.productName, let image = UIImage(named: productImageName){
            self.product = product
            productImage.image = image
            productName.text = name
            productPrice.text = price
        }
    }
    
}
