//
//  SalesTableViewCell.swift
//  TrendyolClone
//
//  Created by Dogukan Gundogan on 12/22/21.
//

import UIKit

class SalesTableViewCell: UITableViewCell {

    @IBOutlet weak var saleImage: UIImageView!
    var saleCategory:String?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
    }
    
    func refresh(sale:Sale){
        if let category = sale.category, let imageName = sale.imageName, let image = UIImage(named: imageName){
            self.saleImage.image = image
            self.saleCategory = category
        }
        
    }
    
}
