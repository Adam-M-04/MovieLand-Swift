//
//  CastMember.swift
//  MovieLand
//
//  Created by Adam Mąka on 26/08/2022.
//

import Foundation

struct CastMember: Codable {
    var id: Int
    var name: String
    var profile_path: String?
    
    var roles: [Role]?
    var character: String?
}
