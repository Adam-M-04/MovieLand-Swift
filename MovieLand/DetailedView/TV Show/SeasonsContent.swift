//
//  SeasonsContent.swift
//  MovieLand
//
//  Created by Adam Mąka on 26/08/2022.
//

import SwiftUI

struct SeasonsContent: View {
    let seasons: [Season]
    let tv_id: Int
    let tv_show_name: String
    
    var body: some View {
        List {
            if seasons.count > 0 {
                Section (header: Text("Seasons")) {
                    ForEach(seasons, id: \.id) { season in
                        if(season.name != "Specials") {
                            NavigationLink (destination: DetailedSeason(season_number: season.season_number, tv_id: tv_id, tv_show_name: tv_show_name)) {
                                ListRow(title: season.name, value: FormatDate(unformatted: season.air_date ?? ""))
                            }
                        }
                    }
                }
            }
        }
    }
}

struct SeasonsContent_Previews: PreviewProvider {
    static var previews: some View {
        SeasonsContent(seasons: [Season(id: 1, name: "Season 1", air_date: "2020-07-21", season_number: 1)], tv_id: 1, tv_show_name: "title")
    }
}
