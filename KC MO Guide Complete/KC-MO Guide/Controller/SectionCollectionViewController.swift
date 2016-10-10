//
//  SectionCollectionViewController.swift
//  KC-MO Guide
//
//  Created by user122109 on 10/10/16.
//  Copyright © 2016 Developers Academy. All rights reserved.
//

import UIKit

class SectionCollectionViewController: UIViewController {

    
    var images:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
       // return images.count
        return 4
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //SectionCollectionViewCell
        
        let mycell:SectionCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! SectionCollectionViewCell
//        
//        let image = mycell.sectionImageView
//        image?.image = #imageLiteral(resourceName: "thumbnail")
//        
        return mycell
    }
    
    
    //Delegate
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
     
        
    }
    
    
    
    
}
