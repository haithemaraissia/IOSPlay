//
//  EpisodesTableViewController.swift
//  Duc Blog
//
//  Created by Duc Tran on 4/3/16.
//  Copyright © 2016 Developers Academy. All rights reserved.
//

import UIKit
import SafariServices

class EpisodesTableViewController: UITableViewController
{

    var places = [Place]()
    
    var testPassed: String = ""
    var sectionPassed : String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
      //  Test.text = testPassed
        
        
       // episodes = Episode.downloadAllEpisodes()
       // Episode.ListPlay()
      //  Episode.DetailPlay()
        places = Place.DownloadAllPlaces(type: sectionPassed)
        for place in places
        {
            print("--Name \(place.name)")
            print("Place Id \(place.placeId)")
            print("Vicinity \(place.vicinity)")
            print("Vicinity \(place.thumbnailURL?.absoluteString)")
        }
        
        
        self.tableView.reloadData()
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
        
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return places.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Episode Cell", for: indexPath) as! EpisodeTableViewCell
        let place = self.places[(indexPath as NSIndexPath).row]
        
        cell.place = place

        return cell
    }
    
    
    // Value To be Passed
    var valueToPass:String!
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:
        IndexPath)
    {
        let selectedPlace = self.places[(indexPath as NSIndexPath).row]
//        
//        // import SafariServices
//        let safariVC = SFSafariViewController(url: URL(string: "https://maps.google.com/?cid=8705674934556788176")!)
//        safariVC.view.tintColor = UIColor(red: 248/255.0, green: 47/255.0, blue: 38/255.0, alpha: 1.0)
//        safariVC.delegate = self
//        self.present(safariVC, animated: true, completion: nil)
//        
        
        valueToPass = selectedPlace.name
        performSegue(withIdentifier: "LocationDetailSegue", sender: self)
    }
    
    
    
    
    // MARK: - Target / Action
    
    @IBAction func fullBlogDidTap(_ sender: AnyObject)
    {
        // import SafariServices
      //  let safariVC = SFSafariViewController(url: URL(string: "http://www.ductran.io/blog")!)
        let safariVC = SFSafariViewController(url: URL(string: "https://maps.google.com/?cid=8705674934556788176")!)

        safariVC.view.tintColor = UIColor(red: 248/255.0, green: 47/255.0, blue: 38/255.0, alpha: 1.0)
        safariVC.delegate = self
        self.present(safariVC, animated: true, completion: nil)
    }
    
    
    
    //Seque
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if (segue.identifier == "SequeTest"){
            
            //intialize new view controller and cast it as your view controller
            var testViewController = segue.destination as! TestViewController
            
            testViewController.testPassed = valueToPass
            
            //your new view controller should have the property that will store passed value 
            
            
        }
        
        
        
    }
  
    
    
    
    
}

extension EpisodesTableViewController : SFSafariViewControllerDelegate
{
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
















