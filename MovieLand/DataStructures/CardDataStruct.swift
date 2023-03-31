import Foundation
import SwiftUI

class CardContent: Codable {
    var id: Int
    var poster_path: String?
    var content_type: ContentType?
    var media_type: String?
    
    var title: String?
    var name: String?
    
    var release_date: String?
    var first_air_date: String?
    
    var character: String?
    var popularity: Double?
    
    init(id: Int) {
        self.id = id
    }
}
