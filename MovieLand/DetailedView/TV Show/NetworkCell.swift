//
//  NetworkRow.swift
//  MovieLand
//
//  Created by Adam Mąka on 28/08/2022.
//

import SwiftUI

struct NetworkCell: View {
    let network: Network
    
    var body: some View {
        URLImage(url_string: getLogoPath(), style: .networkLogo)
            .padding()
            .background(.white)
            .cornerRadius(12)
    }
    
    private func getLogoPath() -> String {
        if network.logo_path?.isEmpty ?? true { return "" }
        return image_185_prefix + (network.logo_path ?? "")
    }
}

struct NetworkCell_Previews: PreviewProvider {
    static var previews: some View {
        NetworkCell(network: Network(id: 1, name: "HBO"))
    }
}
