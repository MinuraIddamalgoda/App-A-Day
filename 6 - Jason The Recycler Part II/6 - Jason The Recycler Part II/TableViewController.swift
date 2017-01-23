//
//  TableViewController.swift
//  6 - Jason The Recycler Part II
//
//  Created by Minura Iddamalgoda on 17/1/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // MARK: - Structs
//    struct Post {
//        let userId: String
//        let id: String
//        let title: String
//        let body: String
//    }
    
    // MARK: - Variables
    //var postArray = [Post]()
    var postArray = [Post]()
    let cellReuseIdentifier = "cell"
    
    // MARK: - Outlets
    @IBOutlet var postsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postsTableView.delegate = self
        postsTableView.dataSource = self
        
        getContactList(from: "http://jsonplaceholder.typicode.com/posts")
        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostTableViewCell = self.postsTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! PostTableViewCell
        cell.userId_idLabel.text = "\(self.postArray[indexPath.row].userId) -- \(self.postArray[indexPath.row].id)"
        cell.titleLabel.text = self.postArray[indexPath.row].title
        cell.bodyTextView.text = self.postArray[indexPath.row].body
        
        return cell
    }
 
    // MARK: JSON methods
    func getContactList(from urlString: String){

        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            let json = JSON(data: data!)
            let postsArray = json.arrayValue
            
            DispatchQueue.main.async {
                for posts in postsArray {
                    
                    let userId = posts["userId"].stringValue
                    let id = posts["id"].stringValue
                    let title = posts["title"].stringValue
                    let body = posts["body"].stringValue
                    
                    let post = Post.init(userId: userId, id: id, title: title, body: body)
                    self.postArray.append(post)
                    
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        task.resume()
        
    }
    

}
