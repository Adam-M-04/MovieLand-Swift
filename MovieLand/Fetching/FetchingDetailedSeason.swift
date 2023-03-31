//
//  FetchingDetailedSeason.swift
//  MovieLand
//
//  Created by Adam Mąka on 28/08/2022.
//

import Foundation

class FetchingDetailedSeason: ObservableObject {
    @Published var content: Season? = nil
    @Published var result_error: Bool = false
    
    func fetch(_ tv_id: Int, _ season_number: Int) {
        let api_url = "https://api.themoviedb.org/3/tv/\(tv_id)/season/\(season_number)?api_key=\(API_KEY)"
        result_error = false
        
        guard let url = URL(string: api_url) else { return; }
        
        let download_task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let detailed_content = try JSONDecoder().decode(Season.self, from: data)
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
