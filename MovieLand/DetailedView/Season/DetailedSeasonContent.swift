//
//  DetailedSeasonContent.swift
//  MovieLand
//
//  Created by Adam Mąka on 28/08/2022.
//

import SwiftUI

struct DetailedSeasonContent: View {
    var season: Season
    let tv_show_name: String
    
    var body: some View {
        VStack {
            URLImage(url_string: getImageURL(), style: .card)
                .padding(.top, -50)
                .padding(.bottom, 20)
                .scaleEffect(1.2)
            List {
                HStack {
                    Spacer()
                    VStack {
                        Text(season.name)
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 2)
                        
                        Text(tv_show_name)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    Spacer()
                }
                
                if !(season.overview?.isEmpty ?? true) {
                    Section (header: Text("Overview")) {
                        Text(season.overview ?? "")
                            .multilineTextAlignment(.center)
                            .padding()
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(maxWidth: .infinity)
                    }
                }
                
                Section (header: Text("Details")) {
                    ListRow(title: "Season number", value: String(season.season_number))
                    if let air_date = season.air_date {
                        ListRow(title: "Air date", value: FormatDate(unformatted: air_date))
                    }
                }
                
                if let episodes = season.episodes {
                    Section (header: Text("Episodes")) {
                        ForEach(episodes, id: \.id) { episode in
                            NavigationLink (destination: DetailedEpisode(episode: episode, season_number: season.season_number, tv_show_name: tv_show_name)) {
                                EpisodeRow(episode: episode)
                                    .padding(.leading, -10)
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func getImageURL() -> String {
        if season.poster_path == nil { return "" }
        return image_original_prefix + String(season.poster_path ?? "")
    }
}

struct DetailedSeasonContent_Previews: PreviewProvider {
    static var previews: some View {
        DetailedSeasonContent(season: Season(id: 1, name: "Season 1", season_number: 1), tv_show_name: "Game of thrones")
    }
}
