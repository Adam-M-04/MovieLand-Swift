//
//  CastRow.swift
//  MovieLand
//
//  Created by Adam Mąka on 28/08/2022.
//

import SwiftUI

struct CastRow: View {
    let person: CastMember
    
    var body: some View {
        HStack {
            URLImage(url_string: getProfilePath(), style: .castRow)
            
            VStack (alignment: .leading) {
                Text(person.name)
                    .font(.title3)
                    .padding(.bottom, 1)
                Text(getCharacter())
                    .font(.body)
                Text(getEpisodesCount())
                    .font(.caption)
            }
        }
    }
    
    private func getProfilePath() -> String {
        if person.profile_path?.isEmpty ?? true { return "" }
        
        return image_185_prefix + (person.profile_path ?? "")
    }
    
    private func getCharacter() -> String {
        if let role = person.roles?[0] {
            return role.character
        }
        return person.character ?? ""
    }
    
    private func getEpisodesCount() -> String {
        if let role = person.roles?[0] {
            let is_plural = role.episode_count > 1 ? "s" : ""
            return String(role.episode_count) + " episode" + is_plural
        }
        return ""
    }
}

struct CastRow_Previews: PreviewProvider {
    static var previews: some View {
        List(0..<3) { item in
            CastRow(person: CastMember(id: 1223786, name: "Emilia Clarke", profile_path: "/r6i4C3kYrBRzUzZ8JKAHYQ0T0dD.jpg", roles: [Role(character: "Daenerys Targaryen", episode_count: 73)]))
                .padding(.leading, -10)
        }
    }
}
