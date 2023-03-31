//
//  NetworkLogo.swift
//  MovieLand
//
//  Created by Adam Mąka on 28/08/2022.
//

import SwiftUI

extension Image {
    func withNetworkLogoImageStyles() -> some View {
        self
            .resizable()
            .scaledToFit()
            .clipped()
            .frame(maxWidth: 120, maxHeight: 100)
    }
}

struct NetworkLogoImageVoid: View {
    var loading: Bool
    
    var body: some View {
        VStack {
            if loading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .controlSize(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                    .frame(height: 80)
            }
            else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .padding(15.0)
                    .frame(height: 80)
                    .symbolRenderingMode(.hierarchical)
            }
        }
    }
}

struct NetworkLogo_Previews: PreviewProvider {
    static var previews: some View {
        NetworkLogoImageVoid(loading: true)
    }
}
