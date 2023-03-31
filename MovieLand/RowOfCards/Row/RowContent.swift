//
//  RowContent.swift
//  MovieLand
//
//  Created by Adam Mąka on 22/08/2022.
//

import SwiftUI

struct RowContent: View {
    @StateObject var fetch_manager: FetchingRowContent
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .center, spacing: 0) {
                if(fetch_manager.items.count > 0) {
                    ForEach(fetch_manager.items, id: \.id) { item in
                        if(item.content_type != nil) {
                            NavigationLink (destination: DetailedView(id: item.id, content_type: item.content_type ?? .movies))
                            {
                                Card(card_item: item)
                            }
                        }
                    }
                }
                else if(!fetch_manager.result_error) {
                    ForEach((1...10), id: \.self) { _ in
                        CardLoading()
                    }
                }
            }
        }
        .frame(height: 290)
    }
}

struct RowContent_Previews: PreviewProvider {
    static var previews: some View {
        RowContent(fetch_manager: FetchingRowContent())
    }
}
