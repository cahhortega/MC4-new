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
    var list = ["oi", "tudo", "bem", "com", "vc", "meu", "nome", "é", "carol"] //Colocar aqui a API
    var searchProduct: [String]?
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progress = 0.85
        navigationController?.setNavigationBarHidden(false, animated: false)
        print(searchProduct)
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
        guard let products = searchProduct else{
            return 0
        }
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "produto", for: indexPath) as! ShelfFormTableViewCell
        if let products = searchProduct {
            cell.textLabel?.text = products[indexPath.row]
            
        }
        
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchProduct = searchText.isEmpty ? searchProduct : searchProduct!.filter({(dataString: String) -> Bool in
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        productTableView.reloadData()
    }
}

