//
//  FetchData.swift
//  MovieLand
//
//  Created by Adam Mąka on 14/08/2022.
//

import Foundation

class FetchingRowContent: ObservableObject {
    @Published var items: [CardContent] = []
    @Published var result_error: Bool = false
    var content_type: ContentType?
    
    func fetch(_ api_url: String, _ content_type: ContentType?, _ cache_content: Bool = true) {
        self.content_type = content_type
        result_error = false
        
        if cache_content {
            if let result_from_cache = homepage_content_cache_manager.GetData(api_url) {
                DispatchQueue.main.async {
                    self.items = result_from_cache.results
                }
                return
            }
        }
        
        guard let url = URL(string: api_url) else { return; }
        
        let download_task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let row_data = try JSONDecoder().decode(RowResult.self, from: data)
                for item in row_data.results { self?.setItemContentType(item) }
                DispatchQueue.main.async {
                    self?.items = row_data.results
                }
                
                row_data.fetch_date = Date.now
                if cache_content {
                    homepage_content_cache_manager.SaveData(api_url, row_data)
                }
            }
            catch {
                print(error)
                DispatchQueue.main.async {
                    self?.result_error = true
                }
            }
        }
        
        download_task.resume()
    }
    
    private func setItemContentType(_ item: CardContent) {
        if(content_type != nil) {
            item.content_type = content_type
        } else {
            switch item.media_type {
                case "movie":
                    item.content_type = ContentType.movies
                case "tv":
                    item.content_type = ContentType.tv_shows
                default:
                    item.content_type = nil
            }
        }
    }
}
