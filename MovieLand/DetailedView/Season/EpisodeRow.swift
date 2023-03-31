//
//  EpisodeRow.swift
//  MovieLand
//
//  Created by Adam Mąka on 29/08/2022.
//

import SwiftUI

struct EpisodeRow: View {
    let episode: Episode
    
    var body: some View {
        HStack {
            URLImage(url_string: getImageURL(), style: .episodeRow)
            VStack (alignment: .leading) {
                Text("S\(episode.season_number):E\(episode.episode_number)")
                    .font(.caption)
                Text(episode.name)
                
                Spacer()
                
                Text(FormatDate(unformatted: episode.air_date ?? ""))
                    .font(.caption)
            }
            .padding(.leading, 2)
        }
    }
    
    private func getImageURL() -> String {
        if episode.still_path == nil {return ""}
        return image_300_prefix + (episode.still_path ?? "")
    }
}

struct EpisodeRow_Previews: PreviewProvider {
    static var previews: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            EpisodeRow(episode: Episode(id: 1, air_date: "13 Jul, 2022", episode_number: 1, season_number: 1, name: "Episode name", overview: "", vote_average: 0.0))
                .padding(.leading, -10)
        }
    }
}
