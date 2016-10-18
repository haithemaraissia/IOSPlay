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
        titleLabel.text = place.name
        descriptionLabel.text = place.vicinity
        createdAtLabel.text = ""
        let thumbnailURL = place.thumbnailURL
        let networkService = NetworkService(url: thumbnailURL!)
        networkService.downloadImage { (imageData) in
            let image = UIImage(data: imageData as Data)
            DispatchQueue.main.async(execute: {
                self.thumbnailImageView.image = image
                self.authorImageView.image = image
                self.authorImageView.layer.cornerRadius = self.authorImageView.bounds.width / 2.0
                self.authorImageView.layer.masksToBounds = true
                self.authorImageView.layer.borderColor = UIColor.white.cgColor
                self.authorImageView.layer.borderWidth = 1.0
            })
        }
    }
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var authorImageView: UIImageView!
}
