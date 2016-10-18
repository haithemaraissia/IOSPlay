//
//  PlaceTableViewCell.swift
//  KC-MO Guide
//
//  Created by Haithem Araissia on 10/11/16.
//  Copyright © 2016 Haithem Araissia. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell
{
    
    var place: Place! {
        didSet {
            self.updateUI()
        }
    }

    func updateUI()
    {
        
        
        
        //{
//            var count: Int?
//            var name: String?
//            var placeId: String?
//            var vicinity: String?
//            var thumbnailURL: URL?
            
            
        titleLabel.text = place.name
        authorImageView.image = UIImage(named: "duc")
        descriptionLabel.text = place.vicinity
createdAtLabel.text = ""
        //  createdAtLabel.text = String(describing: place.count)
        
        let thumbnailURL = place.thumbnailURL
        let networkService = NetworkService(url: thumbnailURL!)
        networkService.downloadImage { (imageData) in
            let image = UIImage(data: imageData as Data)
            DispatchQueue.main.async(execute: {
                self.thumbnailImageView.image = image
            })
        }
        
        authorImageView.layer.cornerRadius = authorImageView.bounds.width / 2.0
        authorImageView.layer.masksToBounds = true
        authorImageView.layer.borderColor = UIColor.white.cgColor
        authorImageView.layer.borderWidth = 1.0
    }
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var authorImageView: UIImageView!
}
