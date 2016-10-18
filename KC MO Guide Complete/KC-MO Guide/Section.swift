//
//  Section.swift
//  KC-MO Guide
//
//  Created by Haithem Araissia on 10/11/16.
//  Copyright © 2016 Haithem Araissia. All rights reserved.
//

import Foundation

struct Section {
    var name : String
    var query: String

}

class SectionModel {
    
    func GetSections() -> [Section]
    {
        let MySection:[Section ] =
            [
                Section(name: "airport", query: "airport"),
                Section(name: "amusement_park", query: "amusement_park"),
                Section(name: "atm", query: "atm"),
                Section(name: "bakery", query: "bakery"),
                Section(name: "bar", query: "bar"),
                Section(name: "beautysalon", query: "beauty_salon"),
                Section(name: "bookstore", query: "book_store"),
                Section(name: "busstation", query: "bus_station"),
                Section(name: "cafe", query: "cafe"),
                Section(name: "doctor", query: "doctor"),
                Section(name: "firestation", query: "fire_station"),
                Section(name: "food", query: "food"),
                Section(name: "furniturestore", query: "furniture_store"),
                Section(name: "gasstation", query: "gas_station"),
                Section(name: "gym", query: "gym"),
                Section(name: "haircare", query: "hair_care"),
                Section(name: "hartwarestore", query: "hartware_store"),
                Section(name: "health", query: "health"),
                Section(name: "hindutemple", query: "hindu_temple"),
                Section(name: "homegoodstore", query: "home_goods_store"),
                Section(name: "hospital", query: "hospital"),
                Section(name: "jwellerystore", query: "jewelry_store"),
                Section(name: "laundry", query: "laundry"),
                Section(name: "lawyer", query: "lawyer"),
                Section(name: "lodging", query: "lodging"),
                Section(name: "mealdelivery", query: "meal_delivery"),
                Section(name: "mealtakeway", query: "meal_takeway"),
                Section(name: "movietheater", query: "movie_theater"),
                Section(name: "museum", query: "museum"),
                Section(name: "nightclub", query: "night_club"),
                Section(name: "park", query: "park"),
                Section(name: "parking", query: "parking"),
                Section(name: "petstore", query: "pet_store"),
                Section(name: "pharmacy", query: "pharmacy"),
                Section(name: "postoffice", query: "post_office"),
                Section(name: "restaurant", query: "restaurant"),
                Section(name: "school", query: "school"),
                Section(name: "shoppingmall", query: "shopping_mall"),
                Section(name: "spa", query: "spa"),
                Section(name: "subwaystation", query: "subway_station"),
                Section(name: "superstore", query: "store"),
                Section(name: "trainstation", query: "trainstation"),
                Section(name: "travelagency", query: "travel_agency"),
                Section(name: "university", query: "university"),
                Section(name: "zoo", query: "zoo")
        ]
      return MySection
    }
    
}
