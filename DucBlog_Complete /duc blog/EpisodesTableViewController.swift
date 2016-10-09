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
    var episodes = [Episode]()
    var places = [Place]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        episodes = Episode.downloadAllEpisodes()
       // Episode.ListPlay()
      //  Episode.DetailPlay()
        places = Place.DownloadAllPlaces(type: "bakery")
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
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:
        IndexPath)
    {
        let selectedPlace = self.places[(indexPath as NSIndexPath).row]
        
        // import SafariServices
        let safariVC = SFSafariViewController(url: URL(string: "https://maps.google.com/?cid=8705674934556788176")!)
        safariVC.view.tintColor = UIColor(red: 248/255.0, green: 47/255.0, blue: 38/255.0, alpha: 1.0)
        safariVC.delegate = self
        self.present(safariVC, animated: true, completion: nil)
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
    
}

extension EpisodesTableViewController : SFSafariViewControllerDelegate
{
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
















