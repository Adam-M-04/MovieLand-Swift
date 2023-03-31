//
//  FetchingDetailedView.swift
//  MovieLand
//
//  Created by Adam Mąka on 21/08/2022.
//

import Foundation

class FetchingDetailedView: ObservableObject {
    @Published var content: DetailedViewContent? = nil
    @Published var result_error: Bool = false
    var content_type: ContentType?
    
    func fetch(_ id: Int, _ content_type: ContentType?) {
        let api_url = "https://api.themoviedb.org/3/\(content_type == .movies ? "movie" : "tv")/\(id)?api_key=\(API_KEY)&append_to_response=\(content_type == .tv_shows ? "aggregate_credits" : "credits")"
        self.content_type = content_type
        result_error = false
        
        guard let url = URL(string: api_url) else { return; }
        
        let download_task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let detailed_content = try JSONDecoder().decode(DetailedViewContent.self, from: data)
                
                DispatchQueue.main.async {
                    self?.content = detailed_content
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
}
