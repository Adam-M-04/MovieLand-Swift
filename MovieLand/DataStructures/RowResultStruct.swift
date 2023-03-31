//
//  RowResultStruct.swift
//  MovieLand
//
//  Created by Adam Mąka on 22/08/2022.
//

import Foundation

class RowResult: Codable {
    var results: [CardContent]
    var fetch_date: Date?
}
