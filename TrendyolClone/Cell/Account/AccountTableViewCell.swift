//
//  AccountTableViewCell.swift
//  TrendyolClone
//
//  Created by Dogukan Gundogan on 12/23/21.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet weak var newIdentifier: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellTypeImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func refresh(account:Account){
        if let accountMenuName = account.accountMenuName, let accountTypeImageName = account.accountTypeImageName, let image = UIImage(named: accountTypeImageName), let isNew = account.isAccountNew{
            if isNew{
                newIdentifier.alpha = 0
            }
            cellLabel.text = accountMenuName
            cellTypeImage.image = image
        }
    }
    
}
