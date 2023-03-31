//
//  SearchResultList.swift
//  MovieLand
//
//  Created by Adam Mąka on 31/08/2022.
//

import SwiftUI

struct SearchResultList: View {
    var results: [SearchResultItem]
    
    var body: some View {
        List(results, id: \.id) { item in
            if item.media_type == "movie" {
                NavigationLink (destination: DetailedView(id: item.id, content_type: .movies)) {
                    SearchResultMovie(movie: item)
                }
            } else if item.media_type == "tv" {
                NavigationLink (destination: DetailedView(id: item.id, content_type: .tv_shows)) {
                    SearchResultTv(tv_show: item)
                }
            } else if item.media_type == "person" {
                NavigationLink (destination: DetailedPerson(id: item.id)) {
                    SearchResultPerson(person: item)
                }
            }
        }
    }
}

struct SearchResultList_Previews: PreviewProvider {
    static var previews: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            SearchResultList(results: [SearchResultItem(id: 1, media_type: "movie")])
        }
    }
}
