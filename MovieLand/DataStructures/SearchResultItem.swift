//
//  SearchResultItem.swift
//  MovieLand
//
//  Created by Adam Mąka on 31/08/2022.
//

import Foundation

struct SearchResultItem: Codable {
    var id: Int
    var media_type: String
    
    // movie
    var title: String?
    var release_date: String?
    var poster_path: String?
    
    // tv
    var name: String?
    var first_air_date: String?
    
    // person
    var profile_path: String?
}
