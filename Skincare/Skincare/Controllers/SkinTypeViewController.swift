//
//  SkinTypeViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 30/11/21.
//

import UIKit

class SkinTypeViewController: UIViewController {
    @IBOutlet var routineTableView: UITableView!
    @IBOutlet var tasksSegmentedControl: UISegmentedControl!
    @IBOutlet var skinTypeLabel: UILabel!
    
    var dataFilter = 0
    var morningTasks: [String] = ["Limpeza", "Hidratação", "Proteção"]
    // Data for home tasks
    var nightTasks: [String] = ["Limpeza", "Esfoliação", "Hidratação"]
    var afternoonTasks: [String] = ["Proteção"]
    //    var types = ["oleosa", "seca", "normal", "mista"]
    let mainString = "Sua pele é oleosa"
    let skinType = "oleosa"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView
        self.routineTableView.delegate = self
        self.routineTableView.dataSource = self
        
        //atributted string para mudar a cor do tipo de pele
        let range = (mainString as NSString).range(of: skinType)
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "Verde")!, range: range)
        skinTypeLabel.attributedText = mutableAttributedString
        
        
        //navigationBar
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Anterior",
            style: .plain,
            target: self,
            action: #selector(back)
        )
        
    }
    //Ação do backButton
    @objc func back(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "forms") as! FormViewController
        vc.currentQuestion = vc.currentQuestion <= vc.questions.count ? 4 : 1
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    //segmentedControl
    @IBAction func segmentedControlAction(sender: AnyObject) {
        switch tasksSegmentedControl.selectedSegmentIndex {
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
    //reload da tableView
    func reload() {
        self.routineTableView.reloadData()
    }
}


//tableView
extension SkinTypeViewController: UITableViewDelegate {
    
}

extension SkinTypeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch dataFilter {
        case 0: return morningTasks.count
        case 1: return afternoonTasks.count
        case 2: return nightTasks.count
        default: return morningTasks.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = routineTableView.dequeueReusableCell(withIdentifier: "rotina", for: indexPath) as! SkinRoutineTableViewCell
        
        var title: String?
        switch dataFilter {
        case 0:
            title = morningTasks[indexPath.row]
        case 1:
            title = afternoonTasks[indexPath.row]
        case 2:
            title = nightTasks[indexPath.row]
        default:
            title = morningTasks[indexPath.row]

        }
        cell.textLabel?.text = title
        
        return cell
    }
    
    
    
}
