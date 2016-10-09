//
//  Episode.swift
//  Duc Blog
//
//  Created by Duc Tran on 4/3/16.
//  Copyright © 2016 Developers Academy. All rights reserved.
//

import Foundation

class Episode
{
    var title: String?
    var description: String?
    var thumbnailURL: URL?
    var createdAt: String?
    var author: String?
    var url: URL?
    
    init(title: String, description: String, thumbnailURL: URL, createdAt: String, author: String)
    {
        self.title = title
        self.description = description
        self.thumbnailURL = thumbnailURL
        self.createdAt = createdAt
        self.author = author
    }
    
    init(espDictionary: [String : AnyObject])
    {
        self.title = espDictionary["title"] as? String
        description = espDictionary["description"] as? String
        thumbnailURL = URL(string: espDictionary["thumbnailURL"] as! String)
        self.createdAt = espDictionary["pubDate"] as? String
        self.author = espDictionary["author"] as? String
        self.url = URL(string: espDictionary["link"] as! String)
    }
    
    static func downloadAllEpisodes() -> [Episode]
    {
        var episodes = [Episode]()
        
        let jsonFile = Bundle.main.path(forResource: "DucBlog", ofType: "json")
        let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonFile!))
        
        // turn the data into foundation objects (Episodes)
        if let jsonDictionary = NetworkService.parseJSONFromData(jsonData) {
            let espDictionaries = jsonDictionary["episodes"] as! [[String : AnyObject]]
            for espDictionary in espDictionaries {
                let newEpisode = Episode(espDictionary: espDictionary)
                episodes.append(newEpisode)
            }
        }
        
        return episodes
    }
    
    static func ListPlay(type: String)
    {
        
        
        let urlString: String = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=39.039355,-94.586439&rankby=distance&types=\(type)&sensor=false&key=AIzaSyABubXDiwRSO2QIkXMQ41DjrrfCLissWPE"
        let myUrl = URL(string: urlString)
        
        let jsonFile = Bundle.main.path(forResource: "DucBlog", ofType: "json")
        let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonFile!))
        let jsonData2 = try? Data(contentsOf: myUrl!)
        
        // turn the data into foundation objects (Episodes)
        if let jsonDictionary2 = NetworkService.parseJSONFromData(jsonData2) {
          //  print("** Json Dictionary \(jsonDictionary2)")
           // print("** Json Dictionary")
            
            let gooDictionaries = jsonDictionary2["results"] as! [[String : AnyObject]]
//            print("** google Dictionary")
//            print("** \(gooDictionaries)")
//            print("** google Dictionary")
//            let espDictionaries = jsonDictionary["episodes"] as! [[String : AnyObject]]
//            for espDictionary in espDictionaries {
//                let newEpisode = Episode(espDictionary: espDictionary)
//                episodes.append(newEpisode)
//            }
            var i : Int = 0;
            let results_list = Results.modelsFromDictionaryArray(array: gooDictionaries as NSArray)
            for result in results_list {
                i = i + 1
                print(i)
                print("--Name \(result.name)")
                print("Place Id \(result.place_id)")
                print("Vicinity \(result.vicinity)")
                print("PhotoCount \(result.photos?.count)")
                
                var photo: String = ""
                
                let Photos = result.photos
                if (Photos != nil)
                {
                    if  (result.photos?.count)! > 0
                    {
                        photo = (result.photos?[0].photo_reference)!
                        print("Photo Reference \(result.photos?[0].photo_reference)")
                    }
                }
                else
                {
                    photo = result.icon!
                    print ("ICON Reference \(result.icon)")
                }
                //You need to download the image or the icon
                print("The Photo is \(photo)")
                print("************")
            }
            
            
        }
        

    }
   
    
    static func GetPhotoPlay(dimension: String, reference: String) ->String
    {
        let photoUrl = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=\(dimension)&photoreference=\(reference)&sensor=true&key=AIzaSyABubXDiwRSO2QIkXMQ41DjrrfCLissWPE"
 
        return photoUrl

    }
    
    static func DetailPlay()
    {
        var photoReferenceTest = GetPhotoPlay(dimension: "350", reference: "CoQBcwAAAEWDuj0bXZ2RTpwX_tkzUqrjQLhzeg00afgRCAcCErbMe9swqW-PUePU0osB6DN43nVPLN-cT4cZ07GRnloXCZO7WaAUABn7sucMNC9CtyyzfpZiiRlGMV1DkrF3hWOsI80v31d-k3rv8fxaZ2G2El62U3rvLh0QM9pIa88kprddEhAw4d0r8FkXCnnpC8ZF2OFOGhT_mR89gmO_iozYN5_eye-XKMN74Q")
        
        print("PhotoReferenceTest : \(photoReferenceTest)")
        
        let urlString: String = "https://maps.googleapis.com/maps/api/place/details/json?placeid=ChIJXYg6IrzvwIcR0IVHdDrF0Hg&key=AIzaSyABubXDiwRSO2QIkXMQ41DjrrfCLissWPE"
        
        let myUrl = URL(string: urlString)
        
        let jsonFile = Bundle.main.path(forResource: "DucBlog", ofType: "json")
        let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonFile!))
        let jsonData2 = try? Data(contentsOf: myUrl!)
        
        // turn the data into foundation objects (Episodes)
        if let jsonDictionary3 = NetworkService.parseJSONFromData(jsonData2) {
            let gooDictionaries4 = jsonDictionary3["result"]  as! NSDictionary
            
            
            //            print("** google Dictionary")
            //            print("** \(gooDictionaries)")
            //            print("** google Dictionary")
            //            let espDictionaries = jsonDictionary["episodes"] as! [[String : AnyObject]]
            //            for espDictionary in espDictionaries {
            //                let newEpisode = Episode(espDictionary: espDictionary)
            //                episodes.append(newEpisode)
            //            }


            var i : Int = 0;
            let results_list =  DetailResult(dictionary: gooDictionaries4)
            
            print(results_list?.name)
            i = i + 1
                print(i)
                print("--Name \(results_list?.name)")
                print("Place Id \(results_list?.place_id)")
                print("formatted Address \(results_list?.formatted_address)")
                print("formatted phone \(results_list?.formatted_phone_number)")
                print("website \(results_list?.website)")
                print("Direction \(results_list?.url)")
                
                
                print("PhotoCount \(results_list?.photos?.count)")
                
                var photo: String = ""
                
                let Photos = results_list?.photos
                if (Photos != nil)
                {
                    if  (results_list?.photos?.count)! > 0
                    {
                        photo = (results_list?.photos?[0].photo_reference)!
                        print("Photo Reference \(results_list?.photos?[0].photo_reference)")
                    }
                }
                else
                {
                    photo = (results_list?.icon!)!
                    print ("ICON Reference \(results_list?.icon)")
                }
                //You need to download the image or the icon
                print("The Photo is \(photo)")
                print("************")
            }
    }
    
    
    
    
    
    
    
    
    
    
    
}





















