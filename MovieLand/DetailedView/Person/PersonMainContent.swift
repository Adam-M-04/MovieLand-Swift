//
//  PersonMainContent.swift
//  MovieLand
//
//  Created by Adam Mąka on 31/08/2022.
//

import SwiftUI

struct PersonMainContent: View {
    let person: DetailedPersonStruct
    @State private var showingBiography = false
    
    var body: some View {
        List {
            HStack {
                Spacer()
                VStack (alignment: .center) {
                    Text(person.name)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                        .padding(.bottom, 1)
                    .textSelection(.enabled)
                    
                    if let age = getAge() {
                        Text(age)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .textSelection(.enabled)
                            .padding(.bottom, age == "" ? 0 : 10)
                    }
                }
                Spacer()
            }
            
            if let biography = person.biography {
                if biography.isEmpty == false {
                    Section (header: Text("Biography")) {
                        HStack {
                            Spacer()
                            VStack {
                                Text(biography)
                                    .multilineTextAlignment(.center)
                                    .textSelection(.enabled)
                                    .padding(.horizontal, -10)
                                    .padding(.top, 5)
                                    .lineLimit(6)
                                
                                HStack {
                                    Image(systemName: "ellipsis.circle")
                                        .foregroundColor(.accentColor)
                                    Button ("Read more") {
                                        showingBiography.toggle()
                                    }
                                    .sheet(isPresented: $showingBiography) {
                                        if #available(iOS 16.0, *) {
                                            LongTextWrapper(text: biography, title: "Biography")
                                                .presentationDetents([.medium, .large])
                                        } else {
                                            LongTextWrapper(text: biography, title: "Biographys")
                                        }
                                    }
                                }
                                .padding(.top, 5)
                            }
                            Spacer()
                        }
                    }
                }
            }
            
            Section (header: Text("Birthday")) {
                if person.birthday != nil || person.place_of_birth != nil {
                    if let birthday = person.birthday {
                        Text(FormatDate(unformatted: birthday))
                    }
                    if let birthplace = person.place_of_birth {
                        Text(birthplace)
                    }
                }
                else {
                    Text("Unknown")
                }
            }
            
            if !(person.deathday?.isEmpty ?? true) {
                Section (header: Text("Deathday")) {
                    Text(FormatDate(unformatted: person.deathday ?? ""))
                }
            }
        }
    }
    
    private func getAge() -> String? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        if let birthday = dateFormatterGet.date(from: person.birthday ?? "") {
            if let deathday = dateFormatterGet.date(from: person.deathday ?? "") {
                let calendar = Calendar.current

                let ageComponents = calendar.dateComponents([.year], from: birthday, to: deathday)
                let age = ageComponents.year!
                return String(age) + (age > 1 ? " years old" : " year old")
            }
            else {
                let now = Date()
                let calendar = Calendar.current

                let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
                let age = ageComponents.year!
                return String(age) + (age > 1 ? " years old" : " year old")
            }
        } else {
           return ""
        }
    }
}

struct PersonMainContent_Previews: PreviewProvider {
    static var previews: some View {
        PersonMainContent(person: DetailedPersonStruct(id: 237, name: "Brad Pitt", profile_path: "/kU3B75TyRiCgE270EyZnHjfivoq.jpg", birthday: "1963-12-18", place_of_birth: "Shawnee, Oklahoma, USA", biography: "William Bradley \"Brad\" Pitt (born December 18, 1963) is an American actor and film producer. Pitt has received two Academy Award nominations and four Golden Globe Award nominations, winning one.", deathday: nil))
    }
}
