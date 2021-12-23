//
//  SelfServiceVC.swift
//  TrendyolClone
//
//  Created by Dogukan Gundogan on 12/23/21.
//

import Foundation
import UIKit

struct SelfServiceVariable{
    static let toSelfServicePlaceVC = "SelfServicePlaceVC"
    static let cellNibName = "SelfServiceCollectionViewCell"
    static let cellIdentifier = "SelfServiceCollectionViewCell"
    static let cornerRadious = CGFloat(10)
    static let bigCell = CGFloat(2)
    static let smallCell = CGFloat(1.2)
    static let rowSpace = CGFloat(50)
    static let itemSpace = CGFloat(20)
    static let itemPerRow = CGFloat(2)
    static let rowInstest = UIEdgeInsets(top: itemSpace, left: itemSpace, bottom: itemSpace*2, right: itemSpace)
}

class SelfServiceVC:UIViewController{

    @IBOutlet weak var selfServiceCollectionView: UICollectionView!
    private lazy var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.frame.width,height: 20 ))
    
    var selfServices = [SelfService]()
    private let serviceNames = ["TrendyolHizliMarket","TrendyolYemek","DilediginAndaKapida","KampanyaliRestoranlar","HemenSiparisVer","YeniLezzetKesfet"]
    
    override func viewDidLoad() {
        createCollectionView()
        createSearchBar()
        createMockData()
    }
    
    
}
//delegation and mock data
extension SelfServiceVC{
    private func createCollectionView(){
        selfServiceCollectionView.register(UINib(nibName: SelfServiceVariable.cellNibName, bundle: nil), forCellWithReuseIdentifier: SelfServiceVariable.cellIdentifier)
        selfServiceCollectionView.delegate = self
        selfServiceCollectionView.dataSource = self
        
        
        let design = UICollectionViewFlowLayout()
        design.minimumInteritemSpacing = SelfServiceVariable.itemSpace
        design.minimumLineSpacing = SelfServiceVariable.rowSpace
        selfServiceCollectionView.collectionViewLayout = design
    }
    private func createMockData(){
        for i in serviceNames{
            let service = SelfService(serviceType: i, serviceImageName: i)
            selfServices.append(service)
        }
    }
    
    private func createSearchBar(){
        searchBar.placeholder = "Marka, Ürün veya Kategori ara"
        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
    }
}

//collection view
extension SelfServiceVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selfServices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelfServiceVariable.cellIdentifier, for: indexPath) as! SelfServiceCollectionViewCell
        
        let item = selfServices[indexPath.row]
        
        cell.refresh(selfService: item)
        cell.serviceImage.layer.cornerRadius = SelfServiceVariable.cornerRadious
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: SelfServiceVariable.toSelfServicePlaceVC, sender: nil)
    }
}

//collection view flow layout
extension SelfServiceVC:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row < 2{
            return sizeCalculator(itemType: SelfServiceVariable.bigCell)
        }
        return sizeCalculator(itemType: SelfServiceVariable.smallCell)
    }
    
    
    private func sizeCalculator(itemType:CGFloat)->CGSize{
        let width = view.frame.size.width
        let cellWidth = (width - (SelfServiceVariable.itemSpace*CGFloat(3)))/SelfServiceVariable.itemPerRow
        return CGSize(width: cellWidth, height: cellWidth * itemType)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return SelfServiceVariable.rowInstest
    }
}
