//
//  PlaceDetail.swift
//  KC-MO Guide
//
//  Created by user122109 on 10/15/16.
//  Copyright © 2016 Developers Academy. All rights reserved.
//

import Foundation

class PlaceDetail
{
    var name: String?
    var placeId: String?
    var formatted_address : String?
    var formatted_phone_number : String?
    var directionUrl : String?
    var website : String?
    var thumbnailURL: URL?

    init()
    {
    }
    
    init(name: String, placeId: String, formatted_address: String,
         formatted_phone_number: String, directionUrl: String,
         website: String, thumbnailURL: URL)
    {
        self.name = name
        self.placeId = placeId
        self.formatted_address = formatted_address
        self.formatted_phone_number = formatted_phone_number
        self.directionUrl = directionUrl
        self.website = website
        self.thumbnailURL = thumbnailURL
    }
    
    func GetPlaceDetail(placeId: String) -> PlaceDetail?
    {
        let urlString: String = "https://maps.googleapis.com/maps/api/place/details/json?placeid=\(placeId)&key=AIzaSyABubXDiwRSO2QIkXMQ41DjrrfCLissWPE"
        let myUrl = URL(string: urlString)
        let jsonData = try? Data(contentsOf: myUrl!)
        if let jsonDictionary = NetworkService.parseJSONFromData(jsonData) {
            let placeDictionaries = jsonDictionary["result"]  as! NSDictionary
            let currentLocation =  DetailResult(dictionary: placeDictionaries)
            var photo: String = ""
            let Photos = currentLocation?.photos
            if (Photos != nil)
            {
                if  (currentLocation?.photos?.count)! > 0
                {
                    photo = GetPlaceDetailPhoto(dimension: "375", reference: (currentLocation?.photos?[0].photo_reference)!)
                }
            }
            else
            {
                photo = (currentLocation?.icon!)!
            }
            
            var website = ""
            if currentLocation?.website != nil
            {
                website = (currentLocation?.website)!
            }
            let currentPlaceDetail = PlaceDetail(
                name: currentLocation!.name!,
                placeId: currentLocation!.place_id!,
                formatted_address: currentLocation!.formatted_address!,
                formatted_phone_number: (currentLocation?.formatted_phone_number!)!,
                directionUrl: currentLocation!.url!,
                website: website,
                thumbnailURL: URL(string:photo)!
            )
            return currentPlaceDetail
        }
        return nil
    }
    
    func GetPlaceDetailPhoto(dimension: String, reference: String) ->String
    {
        let photoUrl = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=\(dimension)&photoreference=\(reference)&sensor=true&key=AIzaSyABubXDiwRSO2QIkXMQ41DjrrfCLissWPE"
        return photoUrl
    }
}
