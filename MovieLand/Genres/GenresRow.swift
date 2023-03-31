//
//  GenresRow.swift
//  MovieLand
//
//  Created by Adam Mąka on 25/08/2022.
//

import SwiftUI

struct GenresRowWithScrollView: View {
    var genres: [Genre]
    
    var body: some View {
        ScrollView (.horizontal) {
            GenresRow(genres: genres)
                .padding(.horizontal, 2)
        }
        .padding(.horizontal, 5)
    }
}

struct GenresRow: View {
    var genres: [Genre]
    
    var body: some View {
        HStack {
            ForEach(genres, id: \.id) { genre in
                GenreCell(name: genre.name)
            }
        }
        .padding(.vertical)
        .multilineTextAlignment(.center)
    }
}

struct GenresRow_Previews: PreviewProvider {
    static var previews: some View {
        GenresRow(genres: [Genre(id: 1, name: "Science Fiction"), Genre(id: 2, name: "Fantasy")])
            .padding(.vertical)
    }
}
