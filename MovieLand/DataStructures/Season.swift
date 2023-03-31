//
//  Season.swift
//  MovieLand
//
//  Created by Adam Mąka on 26/08/2022.
//

import Foundation

struct Season: Codable {
    var id: Int
    //var _id: String?
    var name: String
    var air_date: String?
    var overview: String?
    var poster_path: String?
    var season_number: Int
    var episodes: [Episode]? = []
}
