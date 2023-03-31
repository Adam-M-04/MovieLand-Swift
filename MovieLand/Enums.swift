//
//  Enums.swift
//  MovieLand
//
//  Created by Adam Mąka on 20/08/2022.
//

import Foundation

enum ContentType: Codable {
    case movies, tv_shows
}

enum ImageStyleType: Codable {
    case card, backdrop, countryFlag, castRow, networkLogo, episodeRow
}
