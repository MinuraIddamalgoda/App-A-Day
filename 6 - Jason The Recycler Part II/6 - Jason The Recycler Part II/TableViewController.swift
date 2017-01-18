//
//  TableViewController.swift
//  6 - Jason The Recycler Part II
//
//  Created by Minura Iddamalgoda on 17/1/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // MARK: - Instance vars
    var userId = [String]()
    var id = [String]()
    var postTitle = [String]()
    var postBody = [String]()
    
    var TableData:Array<String> = Array <String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getContactList(from: "http://jsonplaceholder.typicode.com/posts")
        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        cell.textLabel
        
        return cell
    }

    // MARK: JSON methods
    func getContactList(from url: String){
        
    }
    

}
