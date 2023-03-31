//
//  MainContentMovie.swift
//  MovieLand
//
//  Created by Adam Mąka on 30/08/2022.
//

import SwiftUI

struct MainContentMovie: View {
    let movie: DetailedViewContent
    @State private var showingOverview = false
    
    var body: some View {
        List {
            HStack {
                Spacer()
                VStack (alignment: .center) {
                    Text(movie.title ?? "")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                        .padding(.bottom, movie.tagline == nil ? -2 : 2)
                    .textSelection(.enabled)
                    
                    if let tagline = movie.tagline {
                        Text(tagline)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .textSelection(.enabled)
                    }
                    
                    if #available(iOS 16.0, *) {
                        ViewThatFits (in: .horizontal) {
                            GenresRow(genres: movie.genres)
                            GenresRowWithScrollView(genres: movie.genres)
                        }
                    } else {
                        if movie.genres.count < 3 {
                            GenresRow(genres: movie.genres)
                        }
                        else {
                            GenresRowWithScrollView(genres: movie.genres)
                        }
                    }
                }
                Spacer()
            }
            
            Section (header: Text("Overview")) {
                HStack {
                    Spacer()
                    VStack {
                        Text(movie.overview)
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
                                    LongTextWrapper(text: movie.overview, title: "Overview")
                                        .presentationDetents([.medium, .large])
                                } else {
                                    LongTextWrapper(text: movie.overview, title: "Overview")
                                }
                            }
                        }
                        .padding(.top, 5)
                    }
                    Spacer()
                }
            }
            
            Section (header: Text("Details")) {
                if let rating = movie.vote_average {
                    RatingRow(rating: rating)
                }
                
                ListRow(title: "Status", value: movie.status ?? "Unknown")
                
                if let release_date = movie.release_date {
                    ListRow(title: "Release date", value: FormatDate(unformatted: release_date))
                }
                
                if let budget = movie.budget {
                    if budget > 0 {
                        ListRow(title: "Budget", value: formattedCurrency(budget))
                    }
                }
                
                if let revenue = movie.revenue {
                    if revenue > 0 {
                        ListRow(title: "Revenue", value: formattedCurrency(revenue))
                    }
                }
            }
            
            if movie.production_countries.count > 0 {
                Section (header: Text("Production countries")) {
                    ForEach(movie.production_countries, id: \.iso_3166_1) { country in
                        ProductionCountry(country: country)
                    }
                }
            }
        }
    }
    
    private func formattedCurrency(_ value: Int) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.locale = Locale(identifier: "en_US")
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.maximumFractionDigits = 0
        
        return currencyFormatter.string(from: NSNumber(value: value)) ?? String(value)
    }
}

struct MainContentMovie_Previews: PreviewProvider {
    static var previews: some View {
        MainContentMovie(movie: DetailedViewContent(id: 1))
    }
}
