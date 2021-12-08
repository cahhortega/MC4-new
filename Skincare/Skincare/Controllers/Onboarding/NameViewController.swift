//
//  NameViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 30/11/21.
//

import UIKit

class NameViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet var name: UITextField!
    @IBSegueAction func nextButton(_ coder: NSCoder) -> FormViewController? {
        UserDefaults.standard.setValue(name.text, forKey: "name")
        return FormViewController(coder: coder)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progress = 0.1
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
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "Rosa")

       
       }
       @objc func onboardingBack(){
               let storyBoard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyBoard.instantiateViewController(identifier: "firstView") as! OnboardingViewController
               self.navigationController?.pushViewController(vc, animated: false)
           }
}
