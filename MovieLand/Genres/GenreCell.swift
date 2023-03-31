//
//  GenreCell.swift
//  MovieLand
//
//  Created by Adam Mąka on 25/08/2022.
//

import SwiftUI

struct GenreCell: View {
    let name: String
    
    var body: some View {
        Text(name)
            .padding(.horizontal, 12.0)
            .padding(.vertical, 5.0)
            .font(.caption)
            .overlay (
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color(uiColor: .secondaryLabel), lineWidth: 2)
            )
            .lineLimit(1)
            //.frame(maxWidth: .infinity)
    }
    
}

struct GenreCell_Previews: PreviewProvider {
    static var previews: some View {
        List {
            GenreCell(name: "Sci-Fi & Fantasy")
        }
        .preferredColorScheme(.dark)
    }
}
