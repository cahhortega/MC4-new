//
//  NameViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 30/11/21.
//

import UIKit



class NameViewController: UIViewController {
    @IBOutlet var name: UITextField!
    public var jsonObjects: [Product] = []
    
    
    @IBSegueAction func nextButton(_ coder: NSCoder) -> FormViewController? {
        UserDefaults.standard.setValue(name.text, forKey: "name")
        return FormViewController(coder: coder)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        name.layer.borderWidth = 1
        name.layer.cornerRadius = 6
        name.layer.borderColor = UIColor(named: "Rosa")?.cgColor
     
        // Do any additional setup after loading the view.
    

           navigationItem.leftBarButtonItem = UIBarButtonItem(
               title: "Anterior",
               style: .plain,
               target: self,
               action: #selector(onboardingBack)
           )
        
        let url = "https://restapi-skinfeel.herokuapp.com/produtos"
        let instance = Request()
        instance.getData(from: url) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let products):
                    self.jsonObjects = products
                    print(self.jsonObjects)
                case .failure(let error):
                    print(error)
                }
            }
            
        }
        
       }
    

    
    
       @objc func onboardingBack(){
               let storyBoard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyBoard.instantiateViewController(identifier: "firstView") as! OnboardingViewController
               self.navigationController?.pushViewController(vc, animated: false)
           }
}
