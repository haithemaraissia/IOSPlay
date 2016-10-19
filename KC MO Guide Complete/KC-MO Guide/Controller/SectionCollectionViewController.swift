//
//  SectionCollectionViewController.swift
//  KC-MO Guide
//
//  Created by Haithem Araissia on 10/10/16.
//  Copyright © 2016 Developers Academy. All rights reserved.
//

import UIKit

class SectionCollectionViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate{

    var selectedSectionQuery:String!
    var sections:[Section] = SectionModel().GetSections()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let mycell:SectionCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! SectionCollectionViewCell
        mycell.sectionImageView.image  = UIImage(named: sections[indexPath.row].name)
        return mycell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedSectionQuery = sections[indexPath.row].query
        performSegue(withIdentifier: "SectionSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "SectionSegue"){
            let placeTableViewController = segue.destination as! PlaceTableViewController
            placeTableViewController.sectionPassed = selectedSectionQuery
        }
    }
}
