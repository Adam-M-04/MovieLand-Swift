//
//  DetailsTV.swift
//  MovieLand
//
//  Created by Adam Mąka on 26/08/2022.
//

import SwiftUI

struct MainContentTV: View {
    let tv_show: DetailedViewContent
    @State private var showingOverview = false
    
    var body: some View {
        List {
            HStack {
                Spacer()
                VStack (alignment: .center) {
                    Text(tv_show.name ?? "")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                        .padding(.bottom, tv_show.tagline == nil ? -2 : 2)
                    .textSelection(.enabled)
                    
                    if let tagline = tv_show.tagline {
                        Text(tagline)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .textSelection(.enabled)
                    }
                    
                    if #available(iOS 16.0, *) {
                        ViewThatFits (in: .horizontal) {
                            GenresRow(genres: tv_show.genres)
                            GenresRowWithScrollView(genres: tv_show.genres)
                        }
                    } else {
                        if tv_show.genres.count < 3 {
                            GenresRow(genres: tv_show.genres)
                        }
                        else {
                            GenresRowWithScrollView(genres: tv_show.genres)
                        }
                    }
                }
                Spacer()
            }
            
            Section (header: Text("Overview")) {
                HStack {
                    Spacer()
                    VStack {
                        Text(tv_show.overview)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, -10)
                            .padding(.top, 5)
                            .textSelection(.enabled)
                            .lineLimit(4)
                        .fixedSize(horizontal: false, vertical: true)
                        
                        HStack {
                            Image(systemName: "ellipsis.circle")
                                .foregroundColor(.accentColor)
                            Button ("Read more") {
                                showingOverview.toggle()
                            }
                            .sheet(isPresented: $showingOverview) {
                                if #available(iOS 16.0, *) {
                                    LongTextWrapper(text: tv_show.overview, title: "Overview")
                                        .presentationDetents([.medium, .large])
                                } else {
                                    LongTextWrapper(text: tv_show.overview, title: "Overview")
                                }
                            }
                        }
                        .padding(.top, 5)
                    }
                    Spacer()
                }
            }
            
            Section (header: Text("Details")) {
                if let rating = tv_show.vote_average {
                    RatingRow(rating: rating)
                }
                
                ListRow(title: "Status", value: tv_show.status ?? "Unknown")
                
                if let air_date = tv_show.first_air_date {
                    ListRow(title: "First air date", value: FormatDate(unformatted: air_date))
                }
                
                if let episode = tv_show.next_episode_to_air {
                    NavigationLink (destination: DetailedEpisode(episode: episode, season_number: episode.season_number, tv_show_name: tv_show.name ?? "")) {
                        ListRow(title: "Next episode to air", value: FormatDate(unformatted: episode.air_date ?? ""))
                    }
                } else if let episode = tv_show.last_episode_to_air{
                    NavigationLink (destination: DetailedEpisode(episode: episode, season_number: episode.season_number, tv_show_name: tv_show.name ?? "")) {
                        ListRow(title: "Last episode to air", value: FormatDate(unformatted: episode.air_date ?? ""))
                    }
                }
            }
            
            if tv_show.production_countries.count > 0 {
                Section (header: Text("Production countries")) {
                    ForEach(tv_show.production_countries, id: \.iso_3166_1) { country in
                        ProductionCountry(country: country)
                    }
                }
            }
            
            if tv_show.created_by?.count ?? 0 > 0 {
                Section (header: Text("Creators")) {
                    ForEach(tv_show.created_by ?? [], id: \.id) { creator in
                        NavigationLink (destination: DetailedPerson(id: creator.id)) {
                            Text(creator.name)
                        }
                    }
                }
            }
            
            if tv_show.networks?.count ?? 0 > 0 && tv_show.networks?.count ?? 0 <= 2 {
                Section (header: Text("Network" + (tv_show.networks?.count ?? 0 > 1 ? "s" : ""))) {
                    HStack {
                        Spacer()
                        ForEach(tv_show.networks ?? [], id: \.id) { network in
                            NetworkCell(network: network)
                        }
                        Spacer()
                    }
                    .padding(.vertical)
                }
            } else if tv_show.networks?.count ?? 0 > 2 {
                Section (header: Text("Networks")) {
                    ScrollView(.horizontal) {
                        HStack {
                                ForEach(tv_show.networks ?? [], id: \.id) { network in
                                    NetworkCell(network: network)
                                }
                        }
                        .padding(.vertical)
                    }
                }
            }
            
        }
    }
}

struct DetailsTV_Previews: PreviewProvider {
    static var previews: some View {
        MainContentTV(tv_show: DetailedViewContent(id: 0, genres: [Genre(id: 1, name: "Sci & Fantasy"), Genre(id: 1, name: "Sci & Fantasy"), Genre(id: 1, name: "Sci & Fantasy"), Genre(id: 1, name: "Sci & Fantasy")]))
    }
}
