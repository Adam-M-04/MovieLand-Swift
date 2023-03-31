//
//  DetailedPersonContent.swift
//  MovieLand
//
//  Created by Adam Mąka on 31/08/2022.
//

import SwiftUI

struct DetailedPersonContent: View {
    let person: DetailedPersonStruct
    @State private var current_content = 0
    
    var body: some View {
        VStack {
            if let image_url = person.profile_path {
                URLImage(url_string: image_original_prefix + image_url, style: .card)
                    .padding(.top, -50)
                    .padding(.bottom, 20)
                    .scaleEffect(1.2)
            }
            else {
                URLImage(url_string: "", style: .card)
                    .padding(.top, -50)
                    .padding(.bottom, 20)
                    .scaleEffect(1.2)
            }
            
            if current_content == 0 {
                PersonMainContent(person: person)
            } else if current_content == 1 {
                PersonCreditsContent(credits: person.combined_credits?.cast ?? [])
            }
            
            Spacer()
            Picker ("Content", selection: $current_content) {
                Text("Details").tag(0)
                Text("Credits").tag(1)
            }
                .pickerStyle(.segmented)
                .padding([.leading, .bottom, .trailing], 25.0)
                .padding(/*@START_MENU_TOKEN@*/.top, 5.0/*@END_MENU_TOKEN@*/)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct DetailedPersonContent_Previews: PreviewProvider {
    static var previews: some View {
        DetailedPersonContent(person: DetailedPersonStruct(id: 237, name: "Brad Pitt", profile_path: "/kU3B75TyRiCgE270EyZnHjfivoq.jpg", birthday: "1963-12-18", place_of_birth: "Shawnee, Oklahoma, USA", biography: "William Bradley \"Brad\" Pitt (born December 18, 1963) is an American actor and film producer. Pitt has received two Academy Award nominations and four Golden Globe Award nominations, winning one.", deathday: nil))
    }
}
