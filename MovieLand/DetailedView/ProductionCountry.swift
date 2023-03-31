//
//  ProductionCountry.swift
//  MovieLand
//
//  Created by Adam Mąka on 25/08/2022.
//

import SwiftUI

struct ProductionCountry: View {
    let country: ProductionCountryStruct
    
    var body: some View {
        HStack {
            URLImage(url_string: "https://flagcdn.com/w80/\(country.iso_3166_1.lowercased()).png", style: .countryFlag)
            Text(country.name)
                .padding(.all, 10)
                .font(.body)
        }
    }
}

struct ProductionCountry_Previews: PreviewProvider {
    static var previews: some View {
        ProductionCountry(country: ProductionCountryStruct(iso_3166_1: "US", name: "United States"))
    }
}
