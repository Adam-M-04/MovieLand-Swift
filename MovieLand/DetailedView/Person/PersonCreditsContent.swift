//
//  PersonCreditsContent.swift
//  MovieLand
//
//  Created by Adam Mąka on 31/08/2022.
//

import SwiftUI

struct PersonCreditsContent: View {
    let credits: [CardContent]
    
    var body: some View {
        List {
            if credits.count > 0 {
                Section (header: Text("Credits")) {
                    ForEach(credits, id: \.id) { item in
                        if let content_type = getContentType(item.media_type ?? "") {
                            NavigationLink (destination: DetailedView(id: item.id, content_type: content_type)) {
                                PersonCreditsRow(item: item, content_type: content_type)
                                    .padding(.leading, -10)
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func getContentType(_ media_type: String) -> ContentType? {
        switch media_type {
            case "movie": return .movies
            case "tv": return .tv_shows
            default: return nil
        }
    }
}

struct PersonCreditsContent_Previews: PreviewProvider {
    static var previews: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            PersonCreditsContent(credits: [CardContent(id: 1)])
        }
    }
}
