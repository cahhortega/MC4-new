//
//  NewRoutineViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 02/12/21.
//

import UIKit

class NewRoutineViewController: UIViewController {
    @IBOutlet var tasksTableView: UITableView!
    @IBOutlet var routineName: UITextField!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var dataFilter = 0
    var morningTasks: [String] = ["Limpeza", "Hidratação", "Proteção"]
    // Data for home tasks
    var nightTasks: [String] = ["Limpeza", "Esfoliação", "Hidratação"]
    var afternoonTasks: [String] = ["Proteção"]
    
    @IBOutlet var dom: UIButton!
    @IBOutlet var seg: UIButton!
    @IBOutlet var ter: UIButton!
    @IBOutlet var qua: UIButton!
    @IBOutlet var qui: UIButton!
    @IBOutlet var sex: UIButton!
    @IBOutlet var sab: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)

        //picker
        UIDatePicker.appearance().tintColor = UIColor(named: "Rosa")
        //        var week: [UIButton] = [dom, seg, ter, qua, qui, sex, sab]
        
        //textField
        routineName.layer.borderWidth = 1
        routineName.layer.cornerRadius = 6
        routineName.layer.borderColor = UIColor(named: "Rosa")?.cgColor
        
        //tableView
        self.tasksTableView.delegate = self
        self.tasksTableView.dataSource = self
        
        //botões de repetição
        dom.translatesAutoresizingMaskIntoConstraints = false
        dom.addTarget(self, action: #selector(click(button:)), for: .touchUpInside)
        seg.translatesAutoresizingMaskIntoConstraints = false
        seg.addTarget(self, action: #selector(click(button:)), for: .touchUpInside)
        ter.translatesAutoresizingMaskIntoConstraints = false
        ter.addTarget(self, action: #selector(click(button:)), for: .touchUpInside)
        qua.translatesAutoresizingMaskIntoConstraints = false
        qua.addTarget(self, action: #selector(click(button:)), for: .touchUpInside)
        qui.translatesAutoresizingMaskIntoConstraints = false
        qui.addTarget(self, action: #selector(click(button:)), for: .touchUpInside)
        sex.translatesAutoresizingMaskIntoConstraints = false
        sex.addTarget(self, action: #selector(click(button:)), for: .touchUpInside)
        sab.translatesAutoresizingMaskIntoConstraints = false
        sab.addTarget(self, action: #selector(click(button:)), for: .touchUpInside)
        
    }
    //ação do botão de repetição
    @objc func click(button: UIButton){
        if !button.isSelected{
//            botao.setTitleColor(.white, for: .normal)
            button.backgroundColor = UIColor(named: "Rosa")
            button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
            
        } else {
//            botao.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            button.backgroundColor = UIColor(named: "Bg")
            
        }
        button.isSelected = !button.isSelected
        
        
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
    //reload da tableView
    func reload() {
        self.tasksTableView.reloadData()
    }
    
}

//tableView
extension NewRoutineViewController: UITableViewDelegate{
    
}

extension NewRoutineViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch dataFilter {
        case 0:
            button1.isHidden = false
            button2.isHidden = false
            button3.isHidden = false
            button2.tintColor = UIColor(named: "Rosa")
            button3.tintColor = UIColor(named: "Rosa")
            return morningTasks.count
        case 1:
            button2.tintColor = UIColor(named: "Bg")
            button3.tintColor = UIColor(named: "Bg")
            return afternoonTasks.count
        case 2:
            button1.isHidden = false
            button2.isHidden = false
            button3.isHidden = false
            button2.tintColor = UIColor(named: "Rosa")
            button3.tintColor = UIColor(named: "Rosa")
            return nightTasks.count
        default:
            button1.isHidden = false
            button2.isHidden = false
            button3.isHidden = false
            button2.tintColor = UIColor(named: "Rosa")
            button3.tintColor = UIColor(named: "Rosa")
            return morningTasks.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tasksTableView.dequeueReusableCell(withIdentifier: "task", for: indexPath) as! TaskTableViewCell
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
