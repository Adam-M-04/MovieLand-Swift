//
//  CardMovie.swift
//  MovieLand
//
//  Created by Adam Mąka on 20/08/2022.
//

import SwiftUI

struct CardMovie: View {
    let card_item: CardContent
    
    var body: some View {
        if(checkValues()){
            if card_item.poster_path != nil {
                URLImage(url_string: image_342_prefix + String(card_item.poster_path ?? ""), style: .card)
            }
            else {
                URLImage(url_string: "", style: .card)
            }

            Text(card_item.title ?? "")
                .font(.headline)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Text((card_item.release_date ?? "").prefix(4))
                .foregroundColor(Color.white)
        }
        else {
            Image(systemName: "exclamationmark.circle.fill")
                .symbolRenderingMode(.multicolor)
                .scaleEffect(3)
        }
    }
    
    private func checkValues() -> Bool {
        if(card_item.title?.count == 0) {return false}
        if(card_item.release_date?.count == 0) {return false}
        if(card_item.poster_path?.count == 0) {return false}
        return true
    }
}

struct CardMovie_Previews: PreviewProvider {
    static var previews: some View {
        Card(card_item: CardContent(id: 1))
    }
}
