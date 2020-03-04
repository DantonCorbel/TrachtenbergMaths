//
//  ContentsTableViewController.swift
//  TrachtenbergMaths
//
//  Created by Deb Santa Clara on 1/03/20.
//  Copyright © 2020 Deb Santa Clara. All rights reserved.
//

import UIKit

class ContentsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }
    
    var multiplier: Int!
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected section £\(indexPath.section) cell #\(indexPath.row)!")
        
//        let indexPath = tableView.indexPathForSelectedRow;
//        let currentCell = tableView.cellForRow(at: indexPath!) as UITableViewCell!;
//
//        multiplier = currentCell!.textLabel!.text
        if indexPath.section == 1 {
            switch indexPath.row {
            case 0: multiplier = BasicMultiplicationMultiplier.eleven.multiplierInteger
            case 1: multiplier = BasicMultiplicationMultiplier.twelve.multiplierInteger
            case 2: multiplier = BasicMultiplicationMultiplier.nine.multiplierInteger
            case 3: multiplier = BasicMultiplicationMultiplier.eight.multiplierInteger
            case 4: multiplier = BasicMultiplicationMultiplier.six.multiplierInteger
            case 5: multiplier = BasicMultiplicationMultiplier.seven.multiplierInteger
            case 6: multiplier = BasicMultiplicationMultiplier.five.multiplierInteger
            case 7: multiplier = BasicMultiplicationMultiplier.four.multiplierInteger
            case 8: multiplier = BasicMultiplicationMultiplier.three.multiplierInteger
            default:
                multiplier = nil
            }
            performSegue(withIdentifier: "BasicMultiplication", sender: self)
        }
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if (segue.identifier == "BasicMultiplication") {

            // initialize new view controller and cast it as your view controller
            let viewController = segue.destination as! BasicMultiplicationViewController

            // your new view controller should have property that will store passed value
            viewController.multiplier = multiplier
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
}
