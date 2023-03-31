//
//  DetailedPerson.swift
//  MovieLand
//
//  Created by Adam Mąka on 31/08/2022.
//

import SwiftUI

struct DetailedPerson: View {
    @StateObject var fetch_manager = FetchingDetailedPerson()
    let id: Int
    
    var body: some View {
        if (fetch_manager.content != nil && !fetch_manager.result_error) {
            DetailedPersonContent(person: fetch_manager.content ?? DetailedPersonStruct(id: 0, name: ""))
        }
        else if(!fetch_manager.result_error) {
            ProgressView()
                .padding(.vertical, 10.0)
                .controlSize(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                .onAppear() {
                    fetch_manager.fetch(id)
                }
        }
        else {
            VStack {
                Image(systemName: "exclamationmark.circle.fill")
                    .symbolRenderingMode(.multicolor)
                .scaleEffect(3)
                Text("An error occurred")
                    .padding()
            }
        }
    }
}

struct DetailedPerson_Previews: PreviewProvider {
    static var previews: some View {
        DetailedPerson(id: 287)
    }
}
