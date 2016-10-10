/* 
Copyright (c) 2016 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Reviews {
	public var aspects : Array<Aspects>?
	public var author_name : String?
	public var author_url : String?
	public var language : String?
	public var profile_photo_url : String?
	public var rating : Int?
	public var text : String?
	public var time : Int?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let reviews_list = Reviews.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Reviews Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Reviews]
    {
        var models:[Reviews] = []
        for item in array
        {
            models.append(Reviews(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let reviews = Reviews(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Reviews Instance.
*/
	required public init?(dictionary: NSDictionary) {

		if (dictionary["aspects"] != nil) { aspects = Aspects.modelsFromDictionaryArray(array: dictionary["aspects"] as! NSArray) }
		author_name = dictionary["author_name"] as? String
		author_url = dictionary["author_url"] as? String
		language = dictionary["language"] as? String
		profile_photo_url = dictionary["profile_photo_url"] as? String
		rating = dictionary["rating"] as? Int
		text = dictionary["text"] as? String
		time = dictionary["time"] as? Int
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.author_name, forKey: "author_name")
		dictionary.setValue(self.author_url, forKey: "author_url")
		dictionary.setValue(self.language, forKey: "language")
		dictionary.setValue(self.profile_photo_url, forKey: "profile_photo_url")
		dictionary.setValue(self.rating, forKey: "rating")
		dictionary.setValue(self.text, forKey: "text")
		dictionary.setValue(self.time, forKey: "time")

		return dictionary
	}

}
