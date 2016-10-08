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
    
    var episode: Episode! {
        didSet {
            self.updateUI()
        }
    }
    
    func Play2()
    {
        
        //Downloading Image ;//Only Return Image Link
        let urlString: String = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=39.039355,-94.586439&rankby=distance&types=bank&sensor=false&key=AIzaSyABubXDiwRSO2QIkXMQ41DjrrfCLissWPE"
            let myUrl = URL(string: urlString)
        let networkService = NetworkService(url: myUrl!)
        
        networkService.downloadImage{ (imageData) in
            print("* \(imageData)")
            let image = UIImage(data: imageData as Data)
            DispatchQueue.main.async(execute: {
                //self.thumbnailImageView.image = image
                print("* \(imageData)")
            })
        }

    }
    
    func Play()
    {
    
        //Downloading Image ;//Only Return Image Link
        let thumbnailURL = episode.thumbnailURL
        print("% \(thumbnailURL)")
        let networkService = NetworkService(url: thumbnailURL!)
        
        networkService.downloadImage{ (imageData) in
            print("* \(imageData)")
            let image = UIImage(data: imageData as Data)
            DispatchQueue.main.async(execute: {
               //self.thumbnailImageView.image = image
               print("* \(imageData)")
            })
            
            
        }
    }
    
    func updateUI()
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
