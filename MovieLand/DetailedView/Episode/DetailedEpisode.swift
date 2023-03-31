//
//  DetailedEpisode.swift
//  MovieLand
//
//  Created by Adam Mąka on 29/08/2022.
//

import SwiftUI

struct DetailedEpisode: View {
    let episode: Episode
    let season_number: Int
    let tv_show_name: String
    
    var body: some View {
        VStack {
            URLImage(url_string: getImageURL(), style: .backdrop)
            List {
                HStack {
                    Spacer()
                    VStack {
                        Text(episode.name)
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 2)
                        
                        Text(getFormattedString())
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    Spacer()
                }
                
                if !(episode.overview.isEmpty) {
                    Section (header: Text("Overview")) {
                        HStack {
                            Spacer()
                            Text(episode.overview)
                                .multilineTextAlignment(.center)
                                .padding()
                                .fixedSize(horizontal: false, vertical: true)
                                .frame(maxWidth: .infinity)
                            Spacer()
                        }
                    }
                }
                
                Section (header: Text("Details")) {
                    if episode.vote_average > 0 {
                        RatingRow(rating: episode.vote_average)
                    }
                    
                    ListRow(title: "Air date", value: FormatDate(unformatted: episode.air_date ?? "Unknown"))
                }
                
                if let guest_stars = episode.guest_stars {
                    if guest_stars.count > 0 {
                        Section(header: Text("Guest stars")) {
                            ForEach(guest_stars, id: \.id) { person in
                                NavigationLink(destination: DetailedPerson(id: person.id)) {
                                    GuestStar(person: person)
                                        .padding(.leading, -10)
                                }
                            }
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
    
    private func getImageURL() -> String {
        if episode.still_path == nil { return "" }
        return image_original_prefix + String(episode.still_path ?? "")
    }
    
    private func getFormattedString() -> AttributedString {
        return try! AttributedString(markdown: "_\(tv_show_name)_ S\(season_number):E\(episode.episode_number)")
    }
}

struct DetailedEpisode_Previews: PreviewProvider {
    static var previews: some View {
        DetailedEpisode(episode: Episode(id: 1, air_date: "15 Jul, 2022", episode_number: 1, season_number: 1, name: "Episode Name", overview: "Some description of the episode", vote_average: 5.7), season_number: 1, tv_show_name: "TV Show name")
    }
}
