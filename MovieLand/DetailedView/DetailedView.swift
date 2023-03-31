//
//  DetailedView.swift
//  MovieLand
//
//  Created by Adam Mąka on 21/08/2022.
//

import SwiftUI

struct DetailedView: View {
    @StateObject var fetch_manager = FetchingDetailedView()
    let id: Int
    let content_type: ContentType
    
    var body: some View {
        if (fetch_manager.content != nil && !fetch_manager.result_error) {
            if(content_type == .movies) {
                DetailedMovie(movie: fetch_manager.content ?? DetailedViewContent(id: 0))
            }
            if(content_type == .tv_shows) {
                DetailedTV(tv_show: fetch_manager.content ?? DetailedViewContent(id: 0))
            }
        }
        else if(!fetch_manager.result_error) {
            ProgressView()
                .padding(.vertical, 10.0)
                .controlSize(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                .onAppear() {
                    fetch_manager.fetch(id, content_type)
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

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(id: 94997, content_type: .tv_shows)
    }
}
