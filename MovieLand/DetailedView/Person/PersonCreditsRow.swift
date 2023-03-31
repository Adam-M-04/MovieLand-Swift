//
//  PersonCreditsRow.swift
//  MovieLand
//
//  Created by Adam Mąka on 31/08/2022.
//

import SwiftUI

struct PersonCreditsRow: View {
    var item: CardContent
    var content_type: ContentType
    
    var body: some View {
        HStack {
            URLImage(url_string: getProfilePath(), style: .castRow)
            
            VStack (alignment: .leading) {
                Text(getTitle())
                    .font(.title3)
                Text(getReleaseDate())
                    .font(.caption)
                    .padding(.bottom, 1)
                
                Text(item.character ?? "")
                    .font(.body)
            }
        }
    }
    
    private func getProfilePath() -> String {
        if item.poster_path?.isEmpty ?? true { return "" }
        
        return image_185_prefix + (item.poster_path ?? "")
    }
    
    private func getTitle() -> String {
        if content_type == .movies {
            return item.title ?? ""
        }
        return item.name ?? ""
    }
    
    private func getReleaseDate() -> String {
        if content_type == .movies {
            return String(item.release_date?.prefix(4) ?? "")
        }
        return String(item.first_air_date?.prefix(4) ?? "")
    }
}

struct PersonCreditsRow_Previews: PreviewProvider {
    static var previews: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            PersonCreditsRow(item: CardContent(id: 1), content_type: .movies)
        }
    }
}
