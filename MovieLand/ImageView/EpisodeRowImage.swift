//
//  EpisodeRowImage.swift
//  MovieLand
//
//  Created by Adam Mąka on 29/08/2022.
//

import SwiftUI

extension Image {
    func withEpisodeRowImageStyles() -> some View {
        self
            .resizable()
            .scaledToFit()
            .clipped()
            .frame(height: 90)
            .cornerRadius(10)
    }
}

struct EpisodeRowImageVoid: View {
    @Environment(\.colorScheme) var colorScheme
    var loading: Bool
    
    var body: some View {
        VStack {
            if loading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: colorScheme == .light ? .black : .white))
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .controlSize(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                    .frame(width: 160, height: 90)
            }
            else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .padding(15.0)
                    .frame(width: 160, height: 90)
                    .foregroundColor(colorScheme == .light ? .gray : Color(uiColor: .secondarySystemBackground))
            }
        }
        .background(colorScheme == .light ? Color(uiColor: .secondarySystemBackground) : .black)
        .cornerRadius(10)
    }
}

struct EpisodeRowImageVoid_Previews: PreviewProvider {
    static var previews: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            EpisodeRowImageVoid(loading: false)
        }
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            EpisodeRowImageVoid(loading: false)
                .preferredColorScheme(.dark)
        }
    }
}
