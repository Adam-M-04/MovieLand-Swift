//
//  SearchResultStruct.swift
//  MovieLand
//
//  Created by Adam Mąka on 31/08/2022.
//

import Foundation

struct SearchResultStruct: Codable {
    var page: Int
    var total_pages: Int
    var results: [SearchResultItem]
}
