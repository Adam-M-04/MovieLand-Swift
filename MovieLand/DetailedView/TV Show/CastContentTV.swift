//
//  CastContentTV.swift
//  MovieLand
//
//  Created by Adam Mąka on 26/08/2022.
//

import SwiftUI

struct CastContentTV: View {
    let cast: [CastMember]
    
    var body: some View {
        List {
            if cast.count > 0 {
                Section (header: Text("Cast")) {
                    ForEach(cast, id: \.id) { person in
                        NavigationLink (destination: DetailedPerson(id: person.id)) {
                            CastRow(person: person)
                                .padding(.leading, -10)
                        }
                    }
                }
            }
            else {
                Text("Nothing no show")
                    .font(.body)
            }
        }
    }
}

struct CastContentTV_Previews: PreviewProvider {
    static var previews: some View {
        CastContentTV(cast: [CastMember(id: 1223786, name: "Emilia Clarke", profile_path: "/r6i4C3kYrBRzUzZ8JKAHYQ0T0dD.jpg", roles: [Role(character: "Daenerys Targaryen", episode_count: 73)])])
    }
}
