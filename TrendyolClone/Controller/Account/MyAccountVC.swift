//
//  MyAccountVC.swift
//  TrendyolClone
//
//  Created by Dogukan Gundogan on 12/23/21.
//

import Foundation
import UIKit

struct MyAccountVariable{
    static let cellNibName = "AccountTableViewCell"
    static let cellIdentifier = "AccountTableViewCell"
}

class MyAccountVC:UIViewController{
    
    @IBOutlet weak var accountTableView: UITableView!
    
    var accounts = [Account]()
    private let accountMenuName = ["Siparişlerim","Tekrar Satın Al","Önceden Gezindiklerim","Vodafone TL /Paket Yükle","Dijital Servisler Siparişlerim","Mesajlarım","Takip Ettiğim Mağazalar","Trendyol Elite","Hesap Bilgilerim","Yardım","Değerlendirmelerim"]
    
    override func viewDidLoad() {
        accountTableView.delegate = self
        accountTableView.dataSource = self
        accountTableView.register(UINib(nibName: MyAccountVariable.cellNibName, bundle: nil), forCellReuseIdentifier: MyAccountVariable.cellIdentifier)
        createMockData()
    }
    
    private func createMockData(){
        for i in accountMenuName{
            let isNew = randomNew()
            let account = Account(accountTypeImageName: i.replacingOccurrences(of: "/", with: ":"), accountMenuName: i, isAccountNew: isNew)
            accounts.append(account)
        }
    }
    
    private func randomNew()->Bool{
        let random = Int.random(in: 0..<2)
        return random == 0 ? true : false
    }
    
    
}


extension MyAccountVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyAccountVariable.cellIdentifier, for: indexPath) as! AccountTableViewCell
        let account = accounts[indexPath.row]
        cell.refresh(account: account)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
}
