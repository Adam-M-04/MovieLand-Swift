//
//  CardImage.swift
//  MovieLand
//
//  Created by Adam Mąka on 21/08/2022.
//

import SwiftUI

extension Image {
    func withCardImageStyles() -> some View {
        self
            .resizable()
            .scaledToFit()
            .clipped()
            .frame(height: 220)
            .cornerRadius(12)
    }
}

struct CardImageVoid: View {
    @Environment(\.colorScheme) var colorScheme
    var loading: Bool
    
    var body: some View {
        VStack {
            if loading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: colorScheme == .light ? .black : .white))
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .controlSize(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                    .frame(width: 150, height: 220)
            }
            else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .padding(.all)
                    .clipped()
                    .frame(width: 150, height: 220)
                    .accentColor(Color.black)
                    .foregroundColor(colorScheme == .light ? .gray : .black)
            }
        }
        .background(Color(uiColor: .secondarySystemBackground))
        .cornerRadius(12)
    }
}

struct CardImageVoid_Previews: PreviewProvider {
    static var previews: some View {
        CardImageVoid(loading: false)
        
        CardImageVoid(loading: false)
            .preferredColorScheme(.dark)
    }
}
