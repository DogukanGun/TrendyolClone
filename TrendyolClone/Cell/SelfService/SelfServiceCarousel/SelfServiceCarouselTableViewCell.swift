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
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var selfServiceCarousel: UICollectionView!
    private var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }
    private let itemsPerRow:CGFloat=2
    private var sectionInsets:UIEdgeInsets?
    var imagesName = [String]()
    override func awakeFromNib() {
        super.awakeFromNib()
        createMockData()
        let carouselLayout = UICollectionViewFlowLayout()
        carouselLayout.scrollDirection = .horizontal
        carouselLayout.itemSize = .init(width:frame.width-85, height: 150)
        carouselLayout.minimumInteritemSpacing = 0
        selfServiceCarousel.collectionViewLayout = carouselLayout
        pageControl.numberOfPages = imagesName.count
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
        cell.frame.size = CGSize(width: frame.width , height: 150)
        return cell
        
    }
    
    func getCurrentPage() -> Int {
            
            let visibleRect = CGRect(origin: selfServiceCarousel.contentOffset, size: selfServiceCarousel.bounds.size)
            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
            if let visibleIndexPath = selfServiceCarousel.indexPathForItem(at: visiblePoint) {
                return visibleIndexPath.row
            }
            
            return currentPage
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentPage = getCurrentPage()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        currentPage = getCurrentPage()
    }
       
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentPage = getCurrentPage()
    }
    
    
}
