//
//  DetailedPersonStruct.swift
//  MovieLand
//
//  Created by Adam Mąka on 31/08/2022.
//

import Foundation

struct DetailedPersonStruct: Codable {
    var id: Int
    var name: String
    var profile_path: String?
    var birthday: String?
    var place_of_birth: String?
    var biography: String?
    var deathday: String?
    var combined_credits: CreditsPerson?
}
