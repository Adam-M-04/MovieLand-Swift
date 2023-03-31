//
//  SearchResultMovie.swift
//  MovieLand
//
//  Created by Adam Mąka on 31/08/2022.
//

import SwiftUI

struct SearchResultMovie: View {
    let movie: SearchResultItem
    
    var body: some View {
        HStack {
            URLImage(url_string: getImagePath(), style: .castRow)
                .padding(.trailing, 5)
            
            VStack (alignment: .leading) {
                Text(movie.title ?? "")
                    .font(.title3)
                Text(movie.release_date?.prefix(4) ?? "")
                    .font(.body)
                    .padding(.bottom, 1)
                
                Text("Movie")
                    .font(.caption)
            }
        }
        .padding(.leading, -5)
    }
    
    private func getImagePath() -> String {
        if movie.poster_path?.isEmpty ?? true {return ""}
        return image_185_prefix + (movie.poster_path ?? "")
    }
}

struct SearchResultMovie_Previews: PreviewProvider {
    static var previews: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            SearchResultMovie(movie: SearchResultItem(id: 118340, media_type: "movie", title: "Guardians of the Galaxy", release_date: "2014-07-30", poster_path: "/bHarw8xrmQeqf3t8HpuMY7zoK4x.jpg"))
        }
    }
}
