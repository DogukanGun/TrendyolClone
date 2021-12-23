//
//  SalesVC.swift
//  TrendyolClone
//
//  Created by Dogukan Gundogan on 12/22/21.
//

import Foundation
import UIKit

struct SalesVariable{
    static let cellNibName = "SalesTableViewCell"
    static let cellIdentifier = "SalesTableViewCell"
    static let buttonSize = CGFloat(55)
    static let toProductsVC = "ProductsVC"
}
class SalesVC:UIViewController{
    @IBOutlet weak var salesTableView: UITableView!
    
    var sales = [Sale]()
    
    private lazy var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.frame.width-SalesVariable.buttonSize*1.5,height: 20 ))

    override func viewDidLoad() {
        delegateCollectionView()
        createSearchBar()
        createNotificationButton()
        createMockData()
    }
    
}

//table view
extension SalesVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SalesVariable.cellIdentifier, for: indexPath) as! SalesTableViewCell
        
        let item = sales[indexPath.row]
        cell.refresh(sale: item)
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sales.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row != 0){
            performSegue(withIdentifier: SalesVariable.toProductsVC, sender: ProductCellType.ProductCell)
        }else{
            performSegue(withIdentifier: SalesVariable.toProductsVC, sender: ProductCellType.SaleCell)
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

// delegation and mock data
extension SalesVC{
    private func delegateCollectionView(){
        salesTableView.register(UINib(nibName: SalesVariable.cellNibName, bundle: nil), forCellReuseIdentifier: SalesVariable.cellIdentifier)
        salesTableView.delegate = self
        salesTableView.dataSource = self
    }
    private func createMockData(){
        for i in 1...9{
            let sale = Sale(imageName: "sales\(i)", category: "dnem")
            sales.append(sale)
        }
        
    }
    
    private func createNotificationButton(){
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 160, y: 100, width: SalesVariable.buttonSize, height: SalesVariable.buttonSize)
        button.layer.cornerRadius = button.frame.height/2
        button.clipsToBounds = true
        button.tintColor = UIColor.orange
        button.setImage(UIImage(systemName:"star"), for: .normal)
        button.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)
        let rightNavBarButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = rightNavBarButton
    }
    private func createSearchBar(){
        searchBar.placeholder = "Marka, Ürün veya Kategori ara"
        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
    }
    @objc func thumbsUpButtonPressed() {
        print("thumbs up button pressed")
    }
}

//segue
extension SalesVC{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SalesVariable.toProductsVC{
            let cellType = sender as! ProductCellType
            let vc = segue.destination as! ProductsVC
            vc.cellType = cellType
        }
    }
}
