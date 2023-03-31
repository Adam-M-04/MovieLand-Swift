//
//  SearchResultPerson.swift
//  MovieLand
//
//  Created by Adam Mąka on 31/08/2022.
//

import SwiftUI

struct SearchResultPerson: View {
    let person: SearchResultItem
    
    var body: some View {
        HStack {
            URLImage(url_string: getImagePath(), style: .castRow)
                .padding(.trailing, 5)
            
            VStack (alignment: .leading) {
                Text(person.name ?? "")
                    .font(.title3)
                    .padding(.bottom, 1)
                
                Text("Person")
                    .font(.caption)
            }
        }
        .padding(.leading, -5)
    }
    
    private func getImagePath() -> String {
        if person.profile_path?.isEmpty ?? true {return ""}
        return image_185_prefix + (person.profile_path ?? "")
    }
}

struct SearchResultPerson_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultPerson(person: SearchResultItem(id: 1, media_type: "person"))
    }
}
