//
//  NewProductViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 06/12/21.
//

import Foundation
import UIKit

class NewProductRoutineViewController: UIViewController{

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var productTableView: UITableView!
    var list: [String] = []
    var searchProduct: [String]!
    let defaults = UserDefaults.standard
    var chosenProducts: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
//        navigationItem.setHidesBackButton(true, animated: false)
        
        //tableView
        self.productTableView.delegate = self
        self.productTableView.dataSource = self
        
        
        //searchBar
        searchBar.delegate = self
        
    }
//    
//    override func viewWillAppear(_ animated: Bool) {
////        super.viewWillAppear(animated)
////        let chosenProducts = defaults.stringArray(forKey: "myKey") ?? []
////        print(chosenProducts)
// //       list = chosenProduct
//        
//        
//    }

    }
    
}

    
extension NewProductRoutineViewController: UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
//    Delete the row from the data source
//    productTableView.deleteRows(at: [indexPath], with: .fade)
    }
//        else if editingStyle == .insert {
//    Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "produto", for: indexPath) as! ShelfFormTableViewCell
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        list = []
        if searchText == ""{
            list = chosenProducts
        }else {
            for product in chosenProducts{
                if product.lowercased().contains(searchText.lowercased()){
                    list.append(product)
                }
            }
        }
        self.productTableView.reloadData()
    }
}
    

extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}

