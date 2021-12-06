//
//  SettingsTableViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 01/12/21.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var settingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView
        self.settingsTableView.delegate = self
        self.settingsTableView.dataSource = self
        
    }
    
}

//Formatação da tableView
extension SettingsViewController: UITableViewDelegate{
}

extension SettingsViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell  = settingsTableView.dequeueReusableCell(withIdentifier: "name", for: indexPath) as! NameTableViewCell
            return cell
        }
        
        else if indexPath.row == 1 {
            let cell  = settingsTableView.dequeueReusableCell(withIdentifier: "avatar2", for: indexPath) as! AvatarTableViewCell
            return cell
        }
        else if indexPath.row == 2 {
            let cell  = settingsTableView.dequeueReusableCell(withIdentifier: "day", for: indexPath) as! DayTableViewCell
            return cell
        }
        else if indexPath.row == 3 {
            let cell  = settingsTableView.dequeueReusableCell(withIdentifier: "switch", for: indexPath) as! SwitchDayTableViewCell
            cell.labelDay.text = "Manhã"
            return cell
        }
        else if indexPath.row == 4 {
            let cell  = settingsTableView.dequeueReusableCell(withIdentifier: "switch", for: indexPath) as! SwitchDayTableViewCell
            cell.labelDay.text = "Tarde"
            return cell
        }
        else {
            let cell  = settingsTableView.dequeueReusableCell(withIdentifier: "switch", for: indexPath) as! SwitchDayTableViewCell
            cell.labelDay.text = "Noite"
            return cell
            
        }
        
    }
}

/*
 // Override to support conditional editing of the table view.
 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */

/*
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
 if editingStyle == .delete {
 // Delete the row from the data source
 tableView.deleteRows(at: [indexPath], with: .fade)
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
 
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */




