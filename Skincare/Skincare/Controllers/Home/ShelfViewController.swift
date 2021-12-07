//
//  ShelfViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 06/12/21.
//

import UIKit

class ShelfViewController: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var productTableView: UITableView!
    var list = ["oi", "tudo", "bem", "com", "vc", "meu", "nome", "é", "carol"] //Colocar aqui a API
    var searchProduct: [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)

        //tableView
        self.productTableView.delegate = self
        self.productTableView.dataSource = self
        
        
        //searchBar
        searchBar.delegate = self
        searchProduct = list
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
}

extension ShelfViewController: UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchProduct.count
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "estante", for: indexPath) as! ShelfTableViewCell
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
