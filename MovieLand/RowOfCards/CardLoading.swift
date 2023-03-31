//
//  CardLoading.swift
//  MovieLand
//
//  Created by Adam Mąka on 17/08/2022.
//

import SwiftUI

struct CardLoading: View {
    var body: some View {
        VStack {
            VStack {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .controlSize(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                    .frame(width: 150, height: 220)
            }
            .background(Color.gray)
            .cornerRadius(12)

            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .padding(.vertical, 10.0)
                .controlSize(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                
        }
        .frame(width: 170, height: 290)
        .background(.black)
        .cornerRadius(15)
        .padding(5)
    }
}

struct CardLoading_Previews: PreviewProvider {
    static var previews: some View {
        CardLoading()
    }
}
