//
//  LocationDetailController.swift
//  KC-MO Guide
//
//  Created by Haithem Araissia on 10/10/16.
//  Copyright © 2016 Haithem Araissia. All rights reserved.
//

import UIKit

class LocationDetailViewController: UIViewController {

    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var AddressLabel: UILabel!
    @IBOutlet weak var FaceBookButtonLabel: UIButton!
    @IBOutlet weak var PhoneLabel: UILabel!
    @IBOutlet weak var MainPhoto: UIImageView!
    
    var placeIdPassed: String = ""
    var placeDetail = PlaceDetail()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BindPlaceDetail(PlaceId: placeIdPassed)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func DirectionButtonClick(_ sender: AnyObject) {
        UIApplication.shared.openURL(NSURL(string: placeDetail.directionUrl!) as! URL)
    }
    
    @IBAction func faceBookButton(_ sender: AnyObject)
    {
        UIApplication.shared.openURL(NSURL(string: placeDetail.website!) as! URL)
    }
    
    func BindPlaceDetail(PlaceId: String) -> Void
    {
        placeDetail = placeDetail.GetPlaceDetail(placeId: PlaceId)!
        var formattedAddress = ""
        if (placeDetail.formatted_address != nil )
        {
            formattedAddress = placeDetail.formatted_address!
        }
        var formattedPhone = ""
        if (placeDetail.formatted_phone_number != nil )
        {
            formattedPhone = placeDetail.formatted_phone_number!
        }
        var website = ""
        if (placeDetail.website != nil )
        {
            website = placeDetail.website!
        }
        TitleLabel?.text = placeDetail.name
        AddressLabel?.text = formattedAddress
        PhoneLabel?.text =  formattedPhone
        FaceBookButtonLabel.setTitle(website, for: UIControlState.normal)
        let networkService = NetworkService(url: (placeDetail.thumbnailURL)!)
        networkService.downloadImage { (imageData) in
            let image = UIImage(data: imageData as Data)
            DispatchQueue.main.async(execute: {
                self.MainPhoto.image = image
            })
         }
    }
}
