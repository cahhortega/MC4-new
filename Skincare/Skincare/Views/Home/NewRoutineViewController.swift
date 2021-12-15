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
    @IBOutlet weak var dataStart: UIDatePicker!
    @IBOutlet weak var dataEnd: UIDatePicker!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    weak var TodayViewControllerDelegate: TodayViewControllerDelegate?
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
    
    @IBAction func saveFunc(_ sender: Any) {
        guard let routineName = self.routineName.text else {
            return
        }
        let dataEnd: Date = self.dataEnd.date
        let dataStart: Date = self.dataStart.date
        let seg: Bool = (self.seg != nil)
        let ter: Bool = (self.ter != nil)
        let qua: Bool = (self.qua != nil)
        let qui: Bool = (self.qui != nil)
        let sex: Bool = (self.sex != nil)
        let sab: Bool = (self.sab != nil)
        let dom: Bool = (self.dom != nil)
        if dataStart <= Date(){
            print("data invalida")
        }
        if dataEnd <= dataStart{
            print("data fim invalida")
        }
        if seg == false && ter == false && qua == false && qui == false && sex == false && sab == false && dom == false{
            print("ta faltando coisa ai")
        }
       var _ = CoreDataStack.shared.createRoutine(routineName: routineName, dataEnd: Date(), dataStart: Date(), seg: Bool(), ter: Bool(), qua: Bool(), qui: Bool(), sex: Bool(), sab: Bool(), dom: Bool())
    }
}

//tableView
extension NewRoutineViewController: UITableViewDelegate{
    
}

extension NewRoutineViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .insert {
            tasksTableView.beginUpdates()
            tasksTableView.endUpdates()
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "add", for: indexPath) as! AddProductTableViewCell
        
        return cell
        
    }
}
