//
//  PlaceTableViewController.swift
//  KC-MO Guide
//
//  Created by Haithem Araissia on 10/10/16.
//  Copyright © 2016 Haithem Araissia. All rights reserved.
//

import UIKit

class PlaceTableViewController: UITableViewController
{

    var places = [Place]()
    var sectionPassed : String = ""
    var placeIdToBePassed: String!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadPlaces()
    }
    
    func loadPlaces()
    {
        let location = Place()
        places = location.DownloadAllPlaces(type: sectionPassed)
        self.tableView.reloadData()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Place Cell", for: indexPath) as! PlaceTableViewCell
        let place = self.places[(indexPath as NSIndexPath).row]
        cell.place = place
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let selectedPlace = self.places[(indexPath as NSIndexPath).row]
        placeIdToBePassed = selectedPlace.placeId
        performSegue(withIdentifier: "LocationDetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if (segue.identifier == "LocationDetailSegue"){
            let locationDetailViewController = segue.destination as! LocationDetailViewController
            locationDetailViewController.placeIdPassed = placeIdToBePassed
        }
    }
}
