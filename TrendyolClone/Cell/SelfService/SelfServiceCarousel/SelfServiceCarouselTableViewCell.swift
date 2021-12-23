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

struct SelfServiceCarouselTableViewVariable{
    static let cellIdentifier = "CarouselCollectionViewCell"
    static let cellNibName = "CarouselCollectionViewCell"
}
class SelfServiceCarouselTableViewCell: UITableViewCell {
    @IBOutlet weak var selfServiceCarousel: UICollectionView!
    
    private let itemsPerRow:CGFloat=2
    private let sectionInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    var imagesName = [String]()
    override func awakeFromNib() {
        super.awakeFromNib()
        createMockData()
        selfServiceCarousel.register(UINib(nibName: SelfServiceCarouselTableViewVariable.cellNibName, bundle: nil), forCellWithReuseIdentifier: SelfServiceCarouselTableViewVariable.cellIdentifier)
        selfServiceCarousel.delegate = self
        selfServiceCarousel.dataSource = self
        
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelfServiceCarouselTableViewVariable.cellIdentifier, for: indexPath) as! CarouselCollectionViewCell
        let imageName = imagesName[indexPath.row]
        cell.refresh(imageName: imageName)
        cell.frame.size = CGSize(width: self.contentView.frame.width , height: self.contentView.frame.height)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.contentView.frame.width / itemsPerRow, height: self.contentView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return sectionInsets
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return sectionInsets.left
    }
    
    
}
