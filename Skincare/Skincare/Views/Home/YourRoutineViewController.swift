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
    @IBOutlet weak var tableView: UITableView!
    var dataFilter = 0
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var defaults = UserDefaults.standard
    var selectedSection: Int?
    var selectedProducts: [String] = []
    
    var limpezaManha: [String] = []
    var hidratacaoManha: [String] = []
    var protecaoManha: [String] = []
    var protecaoTarde: [String] = []
    var limpezaNoite: [String] = []
    var esfoliacaoNoite: [String] = []
    var protecaoNoite: [String] = []
    
    @IBAction func saveButton(_ sender: Any) {
        let somaManha = limpezaManha.count + hidratacaoManha.count + protecaoManha.count
        let somaTarde = protecaoTarde.count
        let somaNoite = limpezaNoite.count + esfoliacaoNoite.count + protecaoNoite.count
        defaults.set(somaManha, forKey: "somaManha")
        defaults.set(somaTarde, forKey: "somaTarde")
        defaults.set(somaNoite, forKey: "somaNoite")

        defaults.set(true, forKey: "feito")
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        limpezaManha = defaults.stringArray(forKey: "limpezaManha")!
        hidratacaoManha = defaults.stringArray(forKey: "hidratacaoManha")!
        protecaoManha = defaults.stringArray(forKey: "protecaoManha")!
        protecaoTarde = defaults.stringArray(forKey: "protecaoTarde")!
        limpezaNoite = defaults.stringArray(forKey: "limpezaNoite")!
        esfoliacaoNoite = defaults.stringArray(forKey: "esfoliacaoNoite")!
        protecaoNoite = defaults.stringArray(forKey: "protecaoNoite")!
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        //multi seleção
        self.tableView.allowsMultipleSelection = true
        self.tableView.allowsMultipleSelectionDuringEditing = true
        
    }
    //reload da tableView
    func reload() {
        self.tableView.reloadData()
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

extension YourRoutineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataFilter == 0 {
            if section == 0 {
                return defaults.stringArray(forKey: "limpezaManha")!.count
            } else if section == 1 {
                return defaults.stringArray(forKey: "hidratacaoManha")!.count
            } else {
                return defaults.stringArray(forKey: "protecaoManha")!.count
            }
        }
        else if dataFilter == 1 {
            return defaults.stringArray(forKey: "protecaoTarde")!.count
            
        } else {
            if section == 0 {
                return defaults.stringArray(forKey: "limpezaNoite")!.count
            } else if section == 1 {
                return defaults.stringArray(forKey: "esfoliacaoNoite")!.count
                
            } else {
                return defaults.stringArray(forKey: "protecaoNoite")!.count
                
            }
        }
        return 1
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.tableView(tableView, cellForRowAt: indexPath)
            let text = cell.textLabel!.text
            if let text = text {
                NSLog("did select and the text is \(text)")
                    selectedProducts.append(text)
                    print("Novo array", selectedProducts)

        }
    }
        
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = self.tableView(tableView, cellForRowAt: indexPath)
        let text = cell.textLabel!.text
        if let text = text {
            NSLog("did deselect and the text is \(text)")
            if let index = selectedProducts.firstIndex(of: text) {
                selectedProducts.remove(at: index)
                print("Novo array", selectedProducts)
                
            }
            
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
        if dataFilter == 0 {
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "yourRoutine", for: indexPath) as! YourRoutineTableViewCell
                cell.textLabel?.text = limpezaManha[indexPath.row]
                return cell
                
            } else if indexPath.section == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "yourRoutine", for: indexPath) as! YourRoutineTableViewCell
                cell.textLabel?.text = hidratacaoManha[indexPath.row]
                return cell
                
            } else if indexPath.section == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "yourRoutine", for: indexPath) as! YourRoutineTableViewCell
                cell.textLabel?.text = protecaoManha[indexPath.row]
                return cell
                
            }
        } else if dataFilter == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "yourRoutine", for: indexPath) as! YourRoutineTableViewCell
            cell.textLabel?.text = protecaoTarde[indexPath.row]
            return cell
            
        } else {
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "yourRoutine", for: indexPath) as! YourRoutineTableViewCell
                cell.textLabel?.text = limpezaNoite[indexPath.row]
                return cell
            } else if indexPath.section == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "yourRoutine", for: indexPath) as! YourRoutineTableViewCell
                cell.textLabel?.text = esfoliacaoNoite[indexPath.row]
                return cell
                
                
            } else if indexPath.section == 2{
                let cell = tableView.dequeueReusableCell(withIdentifier: "yourRoutine", for: indexPath) as! YourRoutineTableViewCell
                cell.textLabel?.text = protecaoNoite[indexPath.row]
                return cell
                
            }
            
        }
        
        return UITableViewCell()
    }
}
