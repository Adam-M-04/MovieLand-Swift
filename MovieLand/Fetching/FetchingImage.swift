//
//  FetchingImage.swift
//  MovieLand
//
//  Created by Adam Mąka on 16/08/2022.
//

import Foundation
import SwiftUI

struct URLImage: View {
    let url_string: String
    let style: ImageStyleType
    
    @State var data: Data?
    @State var image: UIImage?
    @State var loading: Bool = true
    
    var body: some View {
        if let uiimage = image {
            switch style {
                case .card:
                    Image(uiImage: uiimage)
                        .withCardImageStyles()
                case  .backdrop:
                        Image(uiImage: uiimage)
                            .withBackdropImageStyles()
                case .countryFlag:
                        Image(uiImage: uiimage)
                            .withCountryFlagImageStyles()
                case  .castRow:
                        Image(uiImage: uiimage)
                            .withCastRowImageStyles()
                case  .networkLogo:
                        Image(uiImage: uiimage)
                            .withNetworkLogoImageStyles()
                case  .episodeRow:
                        Image(uiImage: uiimage)
                            .withEpisodeRowImageStyles()
            }
        }
        else {
            switch style {
            case .card:
                if loading {
                    CardImageVoid(loading: true)
                        .onAppear() {
                            fetchImage()
                        }
                }
                else {
                    CardImageVoid(loading: false)
                }
            case .backdrop:
                if loading {
                    BackdropImageVoid(loading: true)
                        .onAppear() {
                            fetchImage()
                        }
                }
                else {
                    BackdropImageVoid(loading: false)
                }
            case .countryFlag:
                if loading {
                    CountryFlagImageVoid(loading: true)
                        .onAppear() {
                            fetchImage()
                        }
                }
                else {
                    CountryFlagImageVoid(loading: false)
                }
            case .castRow:
                if loading {
                    CastRowImageVoid(loading: true)
                        .onAppear() {
                            fetchImage()
                        }
                }
                else {
                    CastRowImageVoid(loading: false)
                }
            case .networkLogo:
                if loading {
                    NetworkLogoImageVoid(loading: true)
                        .onAppear() {
                            fetchImage()
                        }
                }
                else {
                    NetworkLogoImageVoid(loading: false)
                }
            case .episodeRow:
                if loading {
                    EpisodeRowImageVoid(loading: true)
                        .onAppear() {
                            fetchImage()
                        }
                }
                else {
                    EpisodeRowImageVoid(loading: false)
                }
            }
        }
    }
    
    private func fetchImage() {
        if url_string.isEmpty {
            loading = false
            return
        }
        
        if let image_from_cache = image_cache_manager.getImage(url_string) {
            self.image = image_from_cache
            return
        }
        
        guard let url = URL(string: url_string) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                self.image = UIImage(data: data)
                
                if(error == nil) { image_cache_manager.setImage(url_string, image ?? UIImage()) }
            }
            loading = false
        }
        
        task.resume()
    }
}
