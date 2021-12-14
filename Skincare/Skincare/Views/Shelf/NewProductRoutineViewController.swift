//
//  NewProductShelfViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 14/12/21.
//

import Foundation
import UIKit

//DEVE RETORNAR TODA A API

class NewProductShelfViewController: UIViewController{
    @IBOutlet weak var productTableView: UITableView!
    @IBOutlet weak var searchBar: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.setHidesBackButton(false, animated: false)
    }
}
