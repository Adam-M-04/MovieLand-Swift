//
//  CountryFlag.swift
//  MovieLand
//
//  Created by Adam Mąka on 25/08/2022.
//

import SwiftUI

extension Image {
    func withCountryFlagImageStyles() -> some View {
        self
            .resizable()
            .scaledToFit()
            .clipped()
            .frame(width: 60)
    }
}

struct CountryFlagImageVoid: View {
    var loading: Bool
    
    var body: some View {
        VStack {
            if loading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .controlSize(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                    .frame(width: 60, height: 32)
            }
            else {
                Image(systemName: "flag.slash")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .padding(5.0)
                    .frame(width: 60, height: 32)
                    .foregroundColor(.white)
                    .symbolRenderingMode(.hierarchical)
            }
        }
        .background(Color.black)
    }
}

struct CountryFlag_Previews: PreviewProvider {
    static var previews: some View {
        CountryFlagImageVoid(loading: true)
    }
}
