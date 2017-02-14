//
//  ChickenTableViewController.swift
//  12 - Runners
//
//  Created by Minura Iddamalgoda on 13/2/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import UIKit

class ChickenTableViewController: UITableViewController {
    
    // MARK: - Variables
    private var chickenList = [Food]()
    var cellReuseIdentifier = "ChickenCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        createChickens()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createChickens() {
        chickenList.append(Food.init("Chicken Parma", .Chicken, 21.50, 44, UIImage(named: "chix_parma")!))
        chickenList.append(Food.init("Chicken Schnitzel", .Chicken, 18.99, 32, UIImage(named: "chix_schnitz")!))
        chickenList.append(Food.init("Chicken Valentino", .Chicken, 22.30, 10, UIImage(named: "chix_val")!))
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return chickenList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ChickenTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! ChickenTableViewCell
        
        cell.itemNameLabel.text = chickenList[indexPath.row].name
        cell.priceLabel.text = FormatAsCurrency.getFormart(chickenList[indexPath.row].price)
        cell.stockRemainingLabel.text = FormatRemainingStock.getStockPhrase(stock: chickenList[indexPath.row].stockRemaining)
        cell.foodImageView.image = chickenList[indexPath.row].image
        
        return cell
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
