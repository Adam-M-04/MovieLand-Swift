//
//  DetailedViewStruct.swift
//  MovieLand
//
//  Created by Adam Mąka on 22/08/2022.
//

import Foundation

struct DetailedViewContent: Codable {
    var id: Int
    var poster_path: String?
    var backdrop_path: String?
    var content_type: ContentType?
    var media_type: String?
    var overview: String = ""
    var genres: [Genre] = []
    var production_countries: [ProductionCountryStruct] = []
    var tagline: String?
    var status: String?
    var vote_average: Double?
    
    // Movies
    var title: String?
    var release_date: String?
    var budget: Int?
    var revenue: Int?
    var credits: Credits?
    
    // TV Shows
    var name: String?
    var first_air_date: String?
    var next_episode_to_air: Episode?
    var last_episode_to_air: Episode?
    var created_by: [Creator]? = []
    var seasons: [Season]? = []
    var aggregate_credits: Credits?
    var networks: [Network]? = []
}
