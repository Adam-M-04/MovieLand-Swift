//
//  HomepageContentCaching.swift
//  MovieLand
//
//  Created by Adam Mąka on 20/08/2022.
//

import Foundation

let homepage_content_cache_manager = HomepageContentCaching()

class HomepageContentCaching {
    private let defaults = UserDefaults.standard
    
    public func SaveData(_ key: String, _ content: RowResult) {
        do{
            let encoded_data = try JSONEncoder().encode(content)
            defaults.set(encoded_data, forKey: key)
        }
        catch {}
    }
    
    public func GetData(_ key: String) -> RowResult? {
        do {
            let from_cache = defaults.data(forKey: key)
            if from_cache == nil {return nil}
            let row_result = try JSONDecoder().decode(RowResult.self, from: from_cache ?? Data())
            if Calendar.current.isDateInToday(row_result.fetch_date ?? Date()) && row_result.fetch_date != nil { return row_result }
        }
        catch { }
        
        return nil
    }
    
    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}
