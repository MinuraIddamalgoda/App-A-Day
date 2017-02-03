//
//  MoviesViewController.swift
//  8 - MovieDB
//
//  Created by Minura Iddamalgoda on 26/1/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import UIKit


class MoviesViewController: UICollectionViewController {
    
    // MARK: - Instance variables
    // MARK: Model and Controller
    let apiKeys = API_KEYS()
    var resultArr = [SearchResult]()
    var apiCallCompleted: Bool = false
    
    // MARK: View
    fileprivate let reuseIdentifier = "MovieCell"
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    
    // MARK: - Outlets
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIBarButtonItem!
    @IBOutlet var movieCollectionView: UICollectionView!
    
    
    // MARK: - Actions
    @IBAction func searchButtonPressed(_ sender: UIBarButtonItem) {
        performApiCall(apiKey: apiKeys.getApiKey())
    }

    // MARK: - Methods
    // MARK: Model and Controller
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Setting up TextField targets
        searchTextField.addTarget(self, action: #selector(MoviesViewController.textFieldDidChange(textfield:)), for: .editingChanged)
        
        // Setting up UICollectionView
        setUpCollectionView()
    }

    func performApiCall(apiKey: String) {
    
        apiCallCompleted = false
        
        let url = URL.init(string: "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&query=\(getSearchTerm())")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if (error == nil) {
                let json = JSON.init(data: data!)
                let jsonArr = json["results"].arrayValue
                
                DispatchQueue.main.async {
                    
                    for result in jsonArr {
                        let title = result["original_title"].stringValue
                        let poster = self.getPoster(posterPath: result["poster_path"].stringValue)
                        let overview = result["overview"].stringValue
                        let voteCount = result["vote_count"].intValue
                        let voteAvg = result["vote_average"].floatValue
                        
                        let newSearchResult = SearchResult.init(title, poster, overview, voteCount, voteAvg)
                        
                        self.resultArr.append(newSearchResult)
                    }
                }
            } else {
                print(error!)
            }
        }
        task.resume()
        
        self.apiCallCompleted = true
        self.movieCollectionView.reloadData()
    }
    
    // Downloads the poster image for a movie based on the link returned in the
    // API call
    func getPoster(posterPath: String) -> UIImage {
        
        let errorImage = UIImage(named: "32bit-48")
        
        let url = URL.init(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
        let data = try? Data.init(contentsOf: url!)
        
        if data == nil {
            return errorImage!
        } else {
            let poster = UIImage(data: data!)
            return poster!
        }
    }
    
    // Gets the text of searchTextField and replaces spaces 
    // with + in order to properly encode the URL for 
    // API call
    func getSearchTerm() -> String {
        var searchTerm = searchTextField.text
        searchTerm = searchTerm?.replacingOccurrences(of: " ", with: "+")
        return searchTerm!
    }
    
    // MARK: View
    func textFieldDidChange(textfield: UITextField) {
        if textfield.text != "" {
            searchButton.isEnabled = true
        } else {
            searchButton.isEnabled = false
        }
    }
    
    func setUpCollectionView() {
        
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.resultArr.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        let cell: MovieCollectionViewCell = self.movieCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieCollectionViewCell
        
        // Configure the cell
        cell.collectionImageView.image = resultArr[indexPath.row].poster
        cell.collectionLabel.text = resultArr[indexPath.row].title
        
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
