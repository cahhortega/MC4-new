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
    var list: [String]!
    var searchProduct: [String]!
    var selectedProducts: [String]!
    var resultProducts: [String]!
    var myProducts: [String]!
    var filtered: [String]!
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
//        navigationItem.setHidesBackButton(true, animated: false)
        searchProduct = defaults.stringArray(forKey: "completeTable") ?? []
        print(searchProduct)
        selectedProducts = defaults.stringArray(forKey: "myKey") ?? []
        print(selectedProducts)
        filtered = searchProduct.difference(from: selectedProducts)
        print(filtered)
        list = searchProduct
        navigationItem.setHidesBackButton(false, animated: false)

        //tableView
        self.productTableView.delegate = self
        self.productTableView.dataSource = self
        
        //multi seleção
        self.productTableView.allowsMultipleSelection = true
        self.productTableView.allowsMultipleSelectionDuringEditing = true
        
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

extension NewProductRoutineViewController: UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "produto", for: indexPath) as! ShelfFormTableViewCell
        cell.textLabel?.text = filtered[indexPath.row]
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        list = []
        if searchText == ""{
            list = searchProduct
        }else {
            for product in searchProduct{
                if product.lowercased().contains(searchText.lowercased()){
                    list.append(product)
                }
            }
        }
        self.productTableView.reloadData()
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = self.tableView(productTableView, cellForRowAt: indexPath)
//        cell.accessoryType = .checkmark
//        let text = cell.textLabel!.text
//        if let text = text {
//            NSLog("did select and the text is \(text)")
//            myProducts.append(text)
//           // print(myProducts)
//        }
//        defaults.set(myProducts, forKey: "myKey")
//    }
//
//
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        let cell = self.tableView(productTableView, cellForRowAt: indexPath)
//        cell.accessoryType = .none
//        let text = cell.textLabel!.text
//        if let text = text {
//            NSLog("did select and the text is \(text)")
//            filtered = myProducts.filter{$0 != text}
//        }
//       // print(filtered)
//        defaults.set(filtered, forKey: "myKey")
//    }

}

extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}
