//
//  Products.swift
//  TrendyolClone
//
//  Created by Dogukan Gundogan on 12/23/21.
//

import Foundation
import UIKit

struct ProductsVariable{
    struct ProductCell{
        static let cellNibName = "ProductsCollectionViewCell"
        static let cellIdentifier = "ProductsCollectionViewCell"
    }
    struct ProductSaleCell{
        static let cellNibName = "ProductSaleCollectionViewCell"
        static let cellIdentifier = "ProductSaleCollectionViewCell"
    }
    static let cornerRadious = CGFloat(10)
    static let heightMultipForProduct = CGFloat(2)
    static let heightMultipForProductSale = CGFloat(1)
    static let borderColor = UIColor.lightGray.cgColor
    static let rowSpace = CGFloat(0)
    static let itemSpace = CGFloat(0)
    static let borderWidth = CGFloat(1)
    static let itemPerRow = CGFloat(2)
    static let rowInstest = UIEdgeInsets(top: itemSpace, left: itemSpace, bottom: itemSpace*2, right: itemSpace)
}
//init variables
class ProductsVC:UIViewController{
    
    var cellType:ProductCellType?
    private lazy var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.frame.width,height: 20 ))
    
    @IBOutlet weak var productsCollectionView: UICollectionView!
    var productNames = ["Sweet","Ceket","Kadın T-shirt","Erkek Mont","Erkek Gömlek","Erkek T-shirt","Bayan Makyaj Urunu","Güneş Kremi","Aydınlatıcı","Saç Bakım Ürünü","Roll-on"]
    var products = [Product]()
    
    var productsSale = [String]()
    
    override func viewDidLoad() {
        delegateCollectionView()
        createCollectionView()
        createMockData()
        createSearchBar()
    }
   
}

//delegation and mock data
extension ProductsVC{
    private func delegateCollectionView(){
        productsCollectionView.dataSource = self
        productsCollectionView.delegate = self
        productsCollectionView.register(UINib(nibName: ProductsVariable.ProductCell.cellNibName, bundle: nil), forCellWithReuseIdentifier: ProductsVariable.ProductCell.cellIdentifier)
        productsCollectionView.register(UINib(nibName: ProductsVariable.ProductSaleCell.cellNibName, bundle: nil), forCellWithReuseIdentifier: ProductsVariable.ProductSaleCell.cellIdentifier)
    }
    private func createSearchBar(){
        searchBar.placeholder = "Marka, Ürün veya Kategori ara"
        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.rightBarButtonItem = leftNavBarButton
    }
    private func createCollectionView(){
        let design = UICollectionViewFlowLayout()
        design.minimumInteritemSpacing = ProductsVariable.itemSpace
        design.minimumLineSpacing = ProductsVariable.rowSpace
        let width = view.frame.size.width
        let cellWidth = (width - (ProductsVariable.itemSpace*CGFloat(3)))/ProductsVariable.itemPerRow
        if let cellType = cellType{
            if cellType == ProductCellType.ProductCell{
                design.itemSize = CGSize(width: cellWidth, height: cellWidth * ProductsVariable.heightMultipForProduct)
            }else{
                design.itemSize = CGSize(width: cellWidth, height: cellWidth * ProductsVariable.heightMultipForProductSale)

            }
        }
        productsCollectionView.collectionViewLayout = design
    }
    private func createMockData(){
        for (index,productName) in productNames.enumerated(){
            var productPrice = Double.random(in: 9.99 ..< 399.99)
            productPrice = Double(round(100 * productPrice) / 100)
            let product = Product(productName: productName, productImageName: "product\(index+1)", productPrice: "\(productPrice)")
            products.append(product)
        }
        for i in 1...8{
            productsSale.append("productSale\(i)")
        }
    }
}

//collection view
extension ProductsVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let cellType = cellType{
            if cellType == ProductCellType.ProductCell{
                return products.count
            }else{
                return productsSale.count
            }
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cellType = cellType{
            if cellType == ProductCellType.ProductCell{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsVariable.ProductCell.cellIdentifier, for: indexPath) as! ProductsCollectionViewCell
                let item  = products[indexPath.row]
                cell.refresh(product: item)
                cell.layer.borderColor = ProductsVariable.borderColor
                cell.layer.borderWidth = ProductsVariable.borderWidth
                return cell
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsVariable.ProductSaleCell.cellIdentifier, for: indexPath) as! ProductSaleCollectionViewCell
                let item  = productsSale[indexPath.row]
                cell.refresh(imageName: item)
                return cell
            }
            
        }else{
            return UICollectionViewCell()
        }
        
    }
     
}
