//
//  YourRoutineViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 09/12/21.
//

import Foundation
import UIKit

class YourRoutineViewController: UIViewController {
    
    @IBOutlet weak var routineName: UILabel!
    @IBOutlet weak var firstTableView: UITableView!
    var dataFilter = 0
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstTableView.delegate = self
        self.firstTableView.dataSource = self
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
    //reload da tableView
    func reload() {
        self.firstTableView.reloadData()
    }
    
    //segmentedControl
    @IBAction func segmentedControlAction(sender: AnyObject) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            dataFilter = 0
        case 1:
            dataFilter = 1
        case 2:
            dataFilter = 2
        default:
            dataFilter = 0
        }
        reload()
        
    }
}
//tableView
extension YourRoutineViewController: UITableViewDelegate{
    
}

extension YourRoutineViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch dataFilter {
        case 0:
            return 2
        case 1:
            return 2
        case 2:
            return 2
        default:
            return 2
        }        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch dataFilter {
        case 0:
            return 3
        case 1:
            return 1
        case 2:
            return 3
        default:
            return 3
        }
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch dataFilter {
        case 0:
            switch section {
            case 0:
                return "Limpeza"
            case 1:
                return "Hidratação"
            case 2:
                return "Proteção"
            default:
                return "Limpeza"
                
            }
        case 1:
            switch section {
            case 0:
                return "Proteção"
            default:
                return "Proteção"
                
            }
        case 2:
            switch section {
            case 0:
                return "Limpeza"
            case 1:
                return "Esfoliação"
            case 2:
                return "Proteção"
            default:
                return "Limpeza"
                
            }
        default:
            switch section {
            case 0:
                return "Limpeza"
            case 1:
                return "Hidratação"
            case 2:
                return "Proteção"
            default:
                return "Limpeza"
                
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = firstTableView.dequeueReusableCell(withIdentifier: "yourRoutine", for: indexPath) as! YourRoutineTableViewCell
        cell.textLabel?.text = "oi" 
        return cell
        
    }
    
    
}

