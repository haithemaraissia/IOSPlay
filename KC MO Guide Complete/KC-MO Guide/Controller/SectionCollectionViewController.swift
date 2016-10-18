//
//  SectionCollectionViewController.swift
//  KC-MO Guide
//
//  Created by Haithem Araissia on 10/10/16.
//  Copyright © 2016 Developers Academy. All rights reserved.
//

import UIKit

class SectionCollectionViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate{

    var sections:[Section] = SectionModel().GetSections()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let mycell:SectionCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! SectionCollectionViewCell
        mycell.sectionImageView.image  = UIImage(named: sections[indexPath.row].name)
        return mycell
    }
    
    
    //Delegate
    // Value To be Passed
   // var valueToPass:String!
    var selectedSectionQuery:String!
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
                print("You selected cell #\(indexPath.item)")
        
                print("The Query for this cell #\(sections[indexPath.row].name)")
        
      //  valueToPass = selectedPlace.name
        selectedSectionQuery = sections[indexPath.row].query
        performSegue(withIdentifier: "SectionSeque", sender: self)
    }
    
    
    //Seque
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "SectionSeque"){
            
            //intialize new view controller and cast it as your view controller
            let testViewController = segue.destination as! PlaceTableViewController
            
            testViewController.sectionPassed = selectedSectionQuery
            
            //your new view controller should have the property that will store passed value
            
            
        }
        
        
        
    }
    
}
