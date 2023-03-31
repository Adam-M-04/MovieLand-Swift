//
//  CastRowImage.swift
//  MovieLand
//
//  Created by Adam Mąka on 28/08/2022.
//

import SwiftUI

extension Image {
    func withCastRowImageStyles() -> some View {
        self
            .resizable()
            .scaledToFit()
            .clipped()
            .frame(height: 120)
            .cornerRadius(10)
    }
}

struct CastRowImageVoid: View {
    let loading: Bool
    
    var body: some View {
        VStack {
            if loading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: 80, height: 120)
                    .frame(height: 120)
            }
            else {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .padding(15.0)
                    .frame(width: 80, height: 120)
                    .foregroundColor(Color(uiColor: .secondarySystemBackground))
                .symbolRenderingMode(.hierarchical)
            }
        }
        .background(Color.black)
        .cornerRadius(10)
    }
}

struct CastRowImageVoid_Previews: PreviewProvider {
    static var previews: some View {
        CastRowImageVoid(loading: true)
    }
}
