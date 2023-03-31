//
//  DetailedSeason.swift
//  MovieLand
//
//  Created by Adam Mąka on 28/08/2022.
//

import SwiftUI

struct DetailedSeason: View {
    @StateObject var fetch_manager = FetchingDetailedSeason()
    let season_number: Int
    let tv_id: Int
    let tv_show_name: String
    
    var body: some View {
        if (fetch_manager.content != nil && !fetch_manager.result_error) {
            DetailedSeasonContent(season: fetch_manager.content ?? Season(id: 0, name: "", season_number: 0), tv_show_name: tv_show_name)
        }
        else if(!fetch_manager.result_error) {
            ProgressView()
                .padding(.vertical, 10.0)
                .controlSize(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                .onAppear() {
                    fetch_manager.fetch(tv_id, season_number)
                }
        }
        else {
            VStack {
                Image(systemName: "exclamationmark.circle.fill")
                    .symbolRenderingMode(.multicolor)
                .scaleEffect(3)
                Text("An error occurred")
                    .padding()
            }
        }
    }
}

struct DetailedSeason_Previews: PreviewProvider {
    static var previews: some View {
        DetailedSeason(season_number: 1, tv_id: 1399, tv_show_name: "Game of thrones")
    }
}
