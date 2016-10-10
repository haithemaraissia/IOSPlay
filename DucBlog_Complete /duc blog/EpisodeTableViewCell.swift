//
//  EpisodeTableViewCell.swift
//  Duc Blog
//
//  Created by Duc Tran on 4/3/16.
//  Copyright © 2016 Developers Academy. All rights reserved.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell
{
    
    var place: Place! {
        didSet {
            self.updateUI()
        }
    }

    var episode: Episode! {
        didSet {
            self.updateUI()
        }
    }
    func updateUI()
    {
        titleLabel.text = place.name
        authorImageView.image = UIImage(named: "duc")
        descriptionLabel.text = "No Description"
        createdAtLabel.text = "No Creation"
        
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
    
    
    
    
    
    func updateUI2()
    {
        titleLabel.text = episode.title
        authorImageView.image = UIImage(named: "duc")
        descriptionLabel.text = episode.description
        createdAtLabel.text = "Duc Tran | \(episode.createdAt!)"
        
        let thumbnailURL = episode.thumbnailURL
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
