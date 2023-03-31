//
//  Episode.swift
//  MovieLand
//
//  Created by Adam Mąka on 25/08/2022.
//

import Foundation

struct Episode: Codable {
    var id: Int
    var air_date: String?
    var episode_number: Int
    var season_number: Int
    var name: String
    var overview: String
    var still_path: String?
    var vote_average: Double
    var guest_stars: [GuestStarStruct]? = []
}
