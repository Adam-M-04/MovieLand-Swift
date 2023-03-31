//
//  ListRow.swift
//  MovieLand
//
//  Created by Adam Mąka on 26/08/2022.
//

import SwiftUI

struct ListRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.bold)
            Spacer()
            Text(value)
                .multilineTextAlignment(.trailing)
                .padding(.leading)
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ListRow(title: "Status", value: "Ended")
        }
    }
}
