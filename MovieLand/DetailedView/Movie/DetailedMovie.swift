//
//  DetailedMovie.swift
//  MovieLand
//
//  Created by Adam Mąka on 22/08/2022.
//

import SwiftUI

struct DetailedMovie: View {
    let movie: DetailedViewContent
    @State private var current_content = 0
    
    var body: some View {
        VStack {
            if let backdrop_url = movie.backdrop_path {
                URLImage(url_string: image_original_prefix + backdrop_url, style: .backdrop)
            }
            else {
                URLImage(url_string: "", style: .backdrop)
            }
            
            if current_content == 0 {
                MainContentMovie(movie: movie)
            } else if current_content == 1 {
                CastContentMovie(cast: movie.credits?.cast ?? [])
            }
            
            Spacer()
            Picker ("Content", selection: $current_content) {
                Text("Details").tag(0)
                Text("Cast").tag(1)
            }
                .pickerStyle(.segmented)
                .padding([.leading, .bottom, .trailing], 25.0)
                .padding(/*@START_MENU_TOKEN@*/.top, 5.0/*@END_MENU_TOKEN@*/)
                
        }
        .ignoresSafeArea()
    }
}

struct DetailedMovie_Previews: PreviewProvider {
    static var previews: some View {
        DetailedMovie(movie: DetailedViewContent(id: 0))
    }
}
