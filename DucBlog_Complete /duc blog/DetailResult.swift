/*
Copyright (c) 2016 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class DetailResult {
	public var address_components : Array<Address_components>?
	public var adr_address : String?
	public var formatted_address : String?
	public var formatted_phone_number : String?
	public var geometry : Geometry?
	public var icon : String?
	public var id : String?
	public var international_phone_number : String?
	public var name : String?
	public var opening_hours : Opening_hours?
	public var photos : Array<Photos>?
	public var place_id : String?
	public var rating : Double?
	public var reference : String?
	public var reviews : Array<Reviews>?
	public var scope : String?
	public var types : Array<String>?
	public var url : String?
	public var utc_offset : Int?
	public var vicinity : String?
	public var website : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let DetailResult_list = DetailResult.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of DetailResult Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [DetailResult]
    {
        var models:[DetailResult] = []
        for item in array
        {
            models.append(DetailResult(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let DetailResult = DetailResult(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: DetailResult Instance.
*/
	required public init?(dictionary: NSDictionary) {

		if (dictionary["address_components"] != nil) { address_components = Address_components.modelsFromDictionaryArray(array: dictionary["address_components"] as! NSArray) }
		adr_address = dictionary["adr_address"] as? String
		formatted_address = dictionary["formatted_address"] as? String
		formatted_phone_number = dictionary["formatted_phone_number"] as? String
		if (dictionary["geometry"] != nil) { geometry = Geometry(dictionary: dictionary["geometry"] as! NSDictionary) }
		icon = dictionary["icon"] as? String
		id = dictionary["id"] as? String
		international_phone_number = dictionary["international_phone_number"] as? String
		name = dictionary["name"] as? String
		if (dictionary["opening_hours"] != nil) { opening_hours = Opening_hours(dictionary: dictionary["opening_hours"] as! NSDictionary) }
		if (dictionary["photos"] != nil) { photos = Photos.modelsFromDictionaryArray(array: dictionary["photos"] as! NSArray) }
		place_id = dictionary["place_id"] as? String
		rating = dictionary["rating"] as? Double
		reference = dictionary["reference"] as? String
		if (dictionary["reviews"] != nil) { reviews = Reviews.modelsFromDictionaryArray(array: dictionary["reviews"] as! NSArray) }
		scope = dictionary["scope"] as? String
//		if (dictionary["types"] != nil) { types = Types.modelsFromDictionaryArray(dictionary["types"] as! NSArray) }
		url = dictionary["url"] as? String
		utc_offset = dictionary["utc_offset"] as? Int
		vicinity = dictionary["vicinity"] as? String
		website = dictionary["website"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.adr_address, forKey: "adr_address")
		dictionary.setValue(self.formatted_address, forKey: "formatted_address")
		dictionary.setValue(self.formatted_phone_number, forKey: "formatted_phone_number")
		dictionary.setValue(self.geometry?.dictionaryRepresentation(), forKey: "geometry")
		dictionary.setValue(self.icon, forKey: "icon")
		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.international_phone_number, forKey: "international_phone_number")
		dictionary.setValue(self.name, forKey: "name")
		dictionary.setValue(self.opening_hours?.dictionaryRepresentation(), forKey: "opening_hours")
		dictionary.setValue(self.place_id, forKey: "place_id")
		dictionary.setValue(self.rating, forKey: "rating")
		dictionary.setValue(self.reference, forKey: "reference")
		dictionary.setValue(self.scope, forKey: "scope")
		dictionary.setValue(self.url, forKey: "url")
		dictionary.setValue(self.utc_offset, forKey: "utc_offset")
		dictionary.setValue(self.vicinity, forKey: "vicinity")
		dictionary.setValue(self.website, forKey: "website")

		return dictionary
	}

}
