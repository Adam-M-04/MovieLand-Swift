import SwiftUI

struct Card: View {
    var card_item: CardContent
    
    var body: some View {
        VStack {
            if card_item.content_type == ContentType.movies {
                CardMovie(card_item: card_item)
            }
            else if card_item.content_type == ContentType.tv_shows {
                CardTVShow(card_item: card_item)
            }
            else {
                Image(systemName: "exclamationmark.circle.fill")
                    .symbolRenderingMode(.multicolor)
                    .scaleEffect(3)
            }
        }
        .frame(width: 170, height: 290)
        .background(.black)
        .cornerRadius(15)
        .overlay (
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(uiColor: .secondarySystemBackground), lineWidth: 2)
        )
        .padding(5)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(card_item: CardContent(id: 1))
    }
}
