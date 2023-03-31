//
//  GuestStar.swift
//  MovieLand
//
//  Created by Adam Mąka on 30/08/2022.
//

import SwiftUI

struct GuestStar: View {
    let person: GuestStarStruct
    
    var body: some View {
        HStack {
            URLImage(url_string: getProfilePath(), style: .castRow)
            
            VStack (alignment: .leading) {
                Text(person.name)
                    .font(.title3)
                    .padding(.bottom, 1)
                Text(person.character)
                    .font(.body)
            }
        }
    }
    
    private func getProfilePath() -> String {
        if person.profile_path?.isEmpty ?? true { return "" }
        
        return image_185_prefix + (person.profile_path ?? "")
    }
}

struct GuestStar_Previews: PreviewProvider {
    static var previews: some View {
        List(0..<3) { item in
            GuestStar(person: GuestStarStruct(id: 1223786, name: "Emilia Clarke", profile_path: "/r6i4C3kYrBRzUzZ8JKAHYQ0T0dD.jpg", character: "Character"))
        }
    }
}
