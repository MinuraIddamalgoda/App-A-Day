//
//  SteakTableViewController.swift
//  12 - Runners
//
//  Created by Minura Iddamalgoda on 13/2/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import UIKit

class SteakTableViewController: UITableViewController {
    
    // MARK: - Variables
    private var steakList = [Food]()
    let cellReuseIdentifier = "SteakCell"

    // MARK: - Outlets
    
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        tableView.delegate = self
        tableView.dataSource = self
        
        createSteaks()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createSteaks() {
        steakList.append(Food.init("Porterhouse", .Steak, 25.50, 4, UIImage(named: "porterhouse")!))
        steakList.append(Food.init("Eye Fillet", .Steak, 21.35, 1, UIImage(named: "eye_fillet")!))
        steakList.append(Food.init("Scotch", .Steak, 30.75, 0, UIImage(named: "scotch")!))
        steakList.append(Food.init("Rib Eye", .Steak, 19.45, 10, UIImage(named: "rib_eye")!))
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return steakList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SteakTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! SteakTableViewCell
        cell.itemNameLabel.text = steakList[indexPath.row].name
        cell.priceLabel.text = FormatAsCurrency.getFormart(steakList[indexPath.row].price)
        cell.stockRemainingLabel.text = FormatRemainingStock.getStockPhrase(stock: steakList[indexPath.row].stockRemaining)
        cell.foodImageView.image = steakList[indexPath.row].image

        return cell
    }
}
