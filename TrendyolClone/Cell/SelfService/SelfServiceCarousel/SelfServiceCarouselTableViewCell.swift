//
//  SelfServiceCarouselTableViewCell.swift
//  TrendyolClone
//
//  Created by Dogukan Gundogan on 12/24/21.
//

import UIKit

struct SelfServiceCarouselVariable{
    static let cellIdentifier = "CarouselCollectionViewCell"
    static let cellNibName = "CarouselCollectionViewCell"
}
class SelfServiceCarouselTableViewCell: UITableViewCell {

    @IBOutlet weak var selfServiceCarousel: UICollectionView!
    
    var imagesName = [String]()
    override func awakeFromNib() {
        super.awakeFromNib()
        let design = UICollectionViewFlowLayout()
        design.itemSize = CGSize(width: self.selfServiceCarousel.frame.size.width, height: self.selfServiceCarousel.frame.size.height)
        selfServiceCarousel.collectionViewLayout = design
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func createMockData(){
        for i in 1...6{
            imagesName.append("carousel\(i)")
        }
    }
    
}

extension SelfServiceCarouselTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelfServiceVariable.cellIdentifier, for: indexPath) as! CarouselCollectionViewCell
        let imageName = imagesName[indexPath.row]
        cell.refresh(imageName: imageName)
        
        return cell
        
    }
    
    
}
