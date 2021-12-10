//
//  NewProductViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 06/12/21.
//

import Foundation
import UIKit

class NewProductViewController: UIViewController{

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var productTableView: UITableView!
    var list = ["oi", "tudo", "bem", "com", "vc", "meu", "nome", "é", "carol"] //Colocar aqui a API
    var searchProduct: [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
//        navigationItem.setHidesBackButton(true, animated: false)

        //tableView
        self.productTableView.delegate = self
        self.productTableView.dataSource = self
        
        //multi seleção
        self.productTableView.allowsMultipleSelection = true
        self.productTableView.allowsMultipleSelectionDuringEditing = true
        
        //searchBar
        searchBar.delegate = self
        searchProduct = list
        
    }

}

extension NewProductViewController: UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "produto", for: indexPath) as! ShelfFormTableViewCell
        cell.textLabel?.text = searchProduct[indexPath.row]
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchProduct = searchText.isEmpty ? list : list.filter({(dataString: String) -> Bool in
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        productTableView.reloadData()
    }
}

