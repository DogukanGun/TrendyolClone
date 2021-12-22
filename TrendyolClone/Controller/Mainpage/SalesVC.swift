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
}
class SalesVC:UIViewController{
    @IBOutlet weak var salesTableView: UITableView!
    
    var sales = [Sale]()
    
    private lazy var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.frame.width-SalesVariable.buttonSize*1.5,height: 20 ))

    override func viewDidLoad() {
        salesTableView.register(UINib(nibName: SalesVariable.cellNibName, bundle: nil), forCellReuseIdentifier: SalesVariable.cellIdentifier)
        salesTableView.delegate = self
        salesTableView.dataSource = self
        createSearchBar()
        createNotificationButton()
        createMockData()
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


extension SalesVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SalesVariable.cellIdentifier, for: indexPath) as! SalesTableViewCell
        
        let item = sales[indexPath.row] as! Sale
        cell.refresh(sale: item)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sales.count
    }
}
