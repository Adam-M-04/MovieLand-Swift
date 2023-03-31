//
//  SearchResultTv.swift
//  MovieLand
//
//  Created by Adam Mąka on 31/08/2022.
//

import SwiftUI

struct SearchResultTv: View {
    let tv_show: SearchResultItem
    
    var body: some View {
        HStack {
            URLImage(url_string: getImagePath(), style: .castRow)
                .padding(.trailing, 5)
            
            VStack (alignment: .leading) {
                Text(tv_show.name ?? "")
                    .font(.title3)
                Text(tv_show.first_air_date?.prefix(4) ?? "")
                    .font(.body)
                    .padding(.bottom, 1)
                
                Text("TV Show")
                    .font(.caption)
            }
        }
        .padding(.leading, -5)
    }
    
    private func getImagePath() -> String {
        if tv_show.poster_path?.isEmpty ?? true {return ""}
        return image_185_prefix + (tv_show.poster_path ?? "")
    }
}

struct SearchResultTv_Previews: PreviewProvider {
    static var previews: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            SearchResultTv(tv_show: SearchResultItem(id: 118340, media_type: "tv"))
        }
    }
}
