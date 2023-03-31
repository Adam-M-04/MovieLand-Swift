//
//  SearchResult.swift
//  MovieLand
//
//  Created by Adam Mąka on 31/08/2022.
//

import SwiftUI

struct SearchResult: View {
    @StateObject var fetch_manager = FetchingSearchResult()
    var query: String
    
    var body: some View {
        if (fetch_manager.content != nil && !fetch_manager.result_error) {
            SearchResultList(results: fetch_manager.content?.results ?? [])
        }
        else if(!fetch_manager.result_error) {
            ProgressView()
                .padding(.vertical, 10.0)
                .controlSize(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                .onAppear() {
                    fetch_manager.fetch(query)
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

struct SearchResult_Previews: PreviewProvider {
    static var previews: some View {
        SearchResult(query: "Saul")
    }
}
