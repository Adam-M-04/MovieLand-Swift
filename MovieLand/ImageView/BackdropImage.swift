//
//  BackdropImage.swift
//  MovieLand
//
//  Created by Adam Mąka on 22/08/2022.
//

import SwiftUI

extension Image {
    func withBackdropImageStyles() -> some View {
        self
            .resizable()
            .scaledToFit()
            .clipped()
    }
}

struct BackdropImageVoid: View {
    @Environment(\.colorScheme) var colorScheme
    var loading: Bool
    
    var body: some View {
        VStack {
            HStack {
                if loading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .controlSize(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                        .frame(height: 240)
                }
                else {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .padding(.all, 50.0)
                        .clipped()
                        .frame(height: 240)
                    .foregroundColor(colorScheme == ColorScheme.light ? .secondary : Color(uiColor: .secondarySystemBackground))
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .background(Color.black)
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct BackdropImageVoid_Previews: PreviewProvider {
    static var previews: some View {
        BackdropImageVoid(loading: false)
    }
}
