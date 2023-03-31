//
//  RatingRow.swift
//  MovieLand
//
//  Created by Adam Mąka on 28/08/2022.
//

import SwiftUI

struct RatingRow: View {
    let rating: Double
    
    var body: some View {
        HStack {
            Text("Rating")
                .fontWeight(.bold)
            Spacer()
            Text(String(format: "%.1f", rating))
            
            if(getFullStarsCount() >= 0) {
                ForEach((0...getFullStarsCount()), id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
            
            if includeHalfStar() {
                Image(systemName: "star.leadinghalf.filled")
                    .foregroundColor(.yellow)
            }
            
            if getVoidStarsCount() >= 0 {
                ForEach((0...getVoidStarsCount()), id: \.self) { _ in
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                }
            }
        }
    }
    
    private func getFullStarsCount() -> Int {
        if rating == 10 { return 4 }
        return (Int(rating) + 1) / 2 - 1;
    }
    
    private func includeHalfStar() -> Bool {
        if rating == 10 { return false }
        return Int(rating) % 2 == 0
    }
    
    private func getVoidStarsCount() -> Int {
        return 3 - getFullStarsCount() - (includeHalfStar() ? 1 : 0)
    }
}

struct RatingRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            RatingRow(rating: 7.8)
        }
    }
}
