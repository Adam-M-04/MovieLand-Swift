//
//  RowView.swift
//  MovieLand
//
//  Created by Adam Mąka on 10/08/2022.
//

import SwiftUI

struct RowView: View {
    @StateObject var fetch_manager = FetchingRowContent()
    let row_title: String
    let content_url: String
    let content_type: ContentType
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(row_title)
                .font(.headline)
                .padding()
                .onAppear(){
                    if(fetch_manager.items.count == 0 || fetch_manager.result_error ) {
                        fetch_manager.fetch(content_url, content_type)
                    }
                }
            if(fetch_manager.items.count > 0 || !fetch_manager.result_error) {
                RowContent(fetch_manager: fetch_manager)
            }
            else {
                HStack(alignment: .center) {
                    Spacer()
                    
                    Button("Retry") {
                        fetch_manager.fetch(content_url, content_type)
                    }
                    .padding()
                    .buttonStyle(.bordered)
                    
                    Spacer()
                }
                .frame(height: 290)
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(row_title: "Trending", content_url: "https://api.themoviedb.org/3/trending/movie/day?api_key=\(API_KEY)", content_type: ContentType.movies)
    }
}
