//
//  DetailedTV.swift
//  MovieLand
//
//  Created by Adam Mąka on 22/08/2022.
//

import SwiftUI

struct DetailedTV: View {
    let tv_show: DetailedViewContent
    @State private var current_content = 0
    
    var body: some View {
        VStack {
            if tv_show.backdrop_path != nil {
                URLImage(url_string: image_original_prefix + String(tv_show.backdrop_path ?? ""), style: .backdrop)
            }
            else {
                URLImage(url_string: "", style: .backdrop)
            }
            
            if current_content == 0 {
                MainContentTV(tv_show: tv_show)
            } else if current_content == 1 {
                SeasonsContent(seasons: tv_show.seasons ?? [], tv_id: tv_show.id, tv_show_name: tv_show.name ?? "")
            } else if current_content == 2 {
                CastContentTV(cast: tv_show.aggregate_credits?.cast ?? [])
            }
            
            Spacer()
            Picker ("Content", selection: $current_content) {
                Text("Details").tag(0)
                Text("Seasons").tag(1)
                Text("Cast").tag(2)
            }
                .pickerStyle(.segmented)
                .padding([.leading, .bottom, .trailing], 25.0)
                .padding(/*@START_MENU_TOKEN@*/.top, 5.0/*@END_MENU_TOKEN@*/)
                
        }
        .ignoresSafeArea()
    }
}

struct DetailedTV_Previews: PreviewProvider {
    static var previews: some View {
        DetailedTV(tv_show: DetailedViewContent(id: 0))
    }
}
