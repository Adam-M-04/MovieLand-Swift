//
//  FetchingSearchResult.swift
//  MovieLand
//
//  Created by Adam Mąka on 31/08/2022.
//

import Foundation

class FetchingSearchResult: ObservableObject {
    @Published var content: SearchResultStruct? = nil
    @Published var result_error: Bool = false
    
    func fetch(_ query: String) {
        let api_url = "https://api.themoviedb.org/3/search/multi?api_key=\(API_KEY)&query=\(query)"
        result_error = false
        
        guard let url = URL(string: api_url) else { return; }
        
        let download_task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let detailed_content = try JSONDecoder().decode(SearchResultStruct.self, from: data)
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
