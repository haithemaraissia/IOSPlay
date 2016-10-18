//
//  Place.swift
//  Haithem Araissia
//
//  Created by Haithem Araissia on 10/3/16.
//  Copyright © 2016 Haithem Araissia. All rights reserved.
//

import Foundation

class Place
{
    var count: Int?
    var name: String?
    var placeId: String?
    var vicinity: String?
    var thumbnailURL: URL?

    init()
    {
        
    }
    
    init(count: Int, name: String, placeId: String, vicinity: String, thumbnailURL: URL)
    {
        self.count = count
        self.name = name
        self.placeId = placeId
        self.vicinity = vicinity
        self.thumbnailURL = thumbnailURL
    }

    func DownloadAllPlaces(type: String) -> [Place]
    {
        var places = [Place]()
        let urlString: String = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=39.039355,-94.586439&rankby=distance&types=\(type)&sensor=false&key=AIzaSyABubXDiwRSO2QIkXMQ41DjrrfCLissWPE"
        let myUrl = URL(string: urlString)
        let jsonData = try? Data(contentsOf: myUrl!)
        if let jsonDictionary = NetworkService.parseJSONFromData(jsonData) {
            let placesDictionaries = jsonDictionary["results"] as! [[String : AnyObject]]
            var i : Int = 0;
            let results_list = Results.modelsFromDictionaryArray(array: placesDictionaries as NSArray)
            for result in results_list {
                i = i + 1
                var photo: String = ""
                let Photos = result.photos
                if (Photos != nil)
                {
                    if  (result.photos?.count)! > 0
                    {
                        photo = GetPlacePhoto(dimension: "350", reference: (result.photos?[0].photo_reference)!)
                    }
                }
                else
                {
                    photo = result.icon!
                }
                let currentPlace = Place(count: i, name: result.name!, placeId: result.place_id!, vicinity: result.vicinity!, thumbnailURL: URL (string:photo)!)
                places.append(currentPlace)
            }
        }
         return places
    }
    
    func GetPlacePhoto(dimension: String, reference: String) ->String
    {
        let photoUrl = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=\(dimension)&photoreference=\(reference)&sensor=true&key=AIzaSyABubXDiwRSO2QIkXMQ41DjrrfCLissWPE"
        return photoUrl
    }
}





















