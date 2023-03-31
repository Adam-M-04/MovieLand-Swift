//
//  ContentView.swift
//  MovieLand
//
//  Created by Adam Mąka on 10/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var current_content = 0
    @State private var query: String = ""
    @State private var encoded_query: String = ""
    @State private var search_refresher: Bool = false
    private let homepage_movies = Homepage(content_type: ContentType.movies)
    private let homepage_tvs = Homepage(content_type: ContentType.tv_shows)
    
    var body: some View {
        NavigationView {
            VStack {
                if encoded_query.isEmpty || query.isEmpty {
                    Picker ("Content", selection: $current_content) {
                        Text("Movies").tag(0)
                        Text("TV Shows").tag(1)
                    }
                        .pickerStyle(.segmented)
                        .padding()
                        .onAppear() {
                            encoded_query = ""
                        }
                        .onChange(of: current_content) { _ in
                            let generator = UISelectionFeedbackGenerator()
                            generator.selectionChanged()
                        }
                    
                    if(current_content == 0) {
                        homepage_movies
                            .tabItem {
                                Label("Movies", systemImage: "film")
                            }
                    }
                    else {
                        homepage_tvs
                            .tabItem {
                                Label("TV Shows", systemImage: "tv")
                            }
                    }
                }
                else {
                    if search_refresher {
                        SearchResult(query: encoded_query)
                    } else {
                        SearchResult(query: encoded_query)
                    }
                }
            }
            .navigationTitle("MovieLand")
            .searchable(text: $query)
            .onSubmit (of: .search) {
                search_refresher = !search_refresher
                encoded_query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? query
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
