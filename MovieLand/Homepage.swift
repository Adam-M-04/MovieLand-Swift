//
//  Homepage.swift
//  MovieLand
//
//  Created by Adam Mąka on 15/08/2022.
//

import SwiftUI

struct Homepage: View {
    let content_type: ContentType
    
    var body: some View {
        ScrollView {
            RowView(row_title: "Trending", content_url: "https://api.themoviedb.org/3/discover/\(content_type == ContentType.movies ? "movie" : "tv")?sort_by=popularity.desc&api_key=\(API_KEY)", content_type: content_type)
            
            RowView(row_title: "Upcoming", content_url: "https://api.themoviedb.org/3/discover/\(content_type == ContentType.movies ? "movie?primary_release_date.gte=\(getDate(-1))&primary_release_date.lte=\(getDate(7))" : "tv?air_date.gte=\(getDate(-1))&air_date.lte=\(getDate(7))")&api_key=\(API_KEY)", content_type: content_type)
            
            Image("atribution_logo")
                .padding(.top, 50.0)
        }
    }
    
    private func getDate(_ day_diff: Int) -> String {
        var dayComponent = DateComponents()
        dayComponent.day = day_diff // For removing one day (yesterday): -1
        let theCalendar = Calendar.current
        
        let result_date = theCalendar.date(byAdding: dayComponent, to: Date())
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: result_date ?? Date())
    }
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage(content_type: ContentType.movies)
    }
}
