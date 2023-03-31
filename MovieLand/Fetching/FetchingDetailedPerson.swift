//
//  FetchingDetailedPerson.swift
//  MovieLand
//
//  Created by Adam Mąka on 31/08/2022.
//

import Foundation

class FetchingDetailedPerson: ObservableObject {
    @Published var content: DetailedPersonStruct? = nil
    @Published var result_error: Bool = false
    
    func fetch(_ person_id: Int) {
        let api_url = "https://api.themoviedb.org/3/person/\(person_id)?api_key=\(API_KEY)&append_to_response=combined_credits"
        result_error = false
        
        guard let url = URL(string: api_url) else { return; }
        
        let download_task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let detailed_content = try JSONDecoder().decode(DetailedPersonStruct.self, from: data)
                DispatchQueue.main.async {
                    self?.content = detailed_content
                    self?.sortCredits()
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
    
    private func sortCredits() {
        removeDuplicates()
        if !(content?.combined_credits?.cast.isEmpty ?? true) {
            content?.combined_credits?.cast.sort(by: { $0.popularity ?? 0 > $1.popularity ?? 0 })
        }
    }
    
    private func removeDuplicates() {
        var i = 0
        while i + 1 < content?.combined_credits?.cast.count ?? 0 {
            findDuplicateItems(start_index: i, id: content?.combined_credits?.cast[i].id ?? -1)
            i += 1
        }
    }
    
    private func findDuplicateItems(start_index: Int, id: Int) {
        var i = start_index + 1
        while i < content?.combined_credits?.cast.count ?? 0 {
            if content?.combined_credits?.cast[i].id ?? -1 == id {
                content?.combined_credits?.cast.remove(at: i)
            }
            else {
                i += 1
            }
        }
    }
}
