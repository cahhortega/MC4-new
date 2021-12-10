//
//  ShelfViewController.swift
//  Skincare
//
//  Created by Thais da Silva Bras on 01/12/21.
//

import UIKit

class ShelfFormViewController: UIViewController{

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var productTableView: UITableView!
    var searchProduct: [String] = []
    var filteredData: [String]!
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progress = 0.85
        navigationController?.setNavigationBarHidden(false, animated: false)
        print(searchProduct)
        filteredData = searchProduct
        //tableView
        self.productTableView.delegate = self
        self.productTableView.dataSource = self
        
        //multi seleção
        self.productTableView.allowsMultipleSelection = true
        self.productTableView.allowsMultipleSelectionDuringEditing = true
        
        //searchBar
        searchBar.delegate = self
        
        //navigationBar
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Anterior",
            style: .plain,
            target: self,
            action: #selector(back)
        )
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "Rosa")


    }
    //Ação do backButton
    @objc func back(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "type") as! SkinTypeViewController
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    

}

extension ShelfFormViewController: UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "produto", for: indexPath) as! ShelfFormTableViewCell
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if searchText == ""{
            filteredData = searchProduct
        }else {
            for product in searchProduct{
                if product.lowercased().contains(searchText.lowercased()){
                    filteredData.append(product)
                }
            }
        }
        self.productTableView.reloadData()
    }
}

