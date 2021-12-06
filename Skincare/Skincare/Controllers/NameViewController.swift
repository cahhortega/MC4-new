//
//  NameViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 30/11/21.
//

import UIKit

class NameViewController: UIViewController {
    @IBOutlet var name: UITextField!
    
    @IBAction func nextView(_ sender: Any) {
        performSegue(withIdentifier: "formsView", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
       }
       @objc func onboardingBack(){
               let storyBoard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyBoard.instantiateViewController(identifier: "firstView") as! OnboardingViewController
               self.navigationController?.pushViewController(vc, animated: false)
           }
}
