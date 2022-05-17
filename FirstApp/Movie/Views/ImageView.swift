//
//  ImageView.swift
//  FirstApp
//
//  Created by Mauche Gauthier on 19/04/2022.
//
import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image:UIImage = UIImage()
    var typeDisplay: String
    
    init(withURL url:String, type: String) {
        imageLoader = ImageLoader(urlString:url)
        typeDisplay = type
    }
    
    var body: some View {
        
      
        if(self.typeDisplay == "posterDisplay"){
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 100)
                .padding(.horizontal)
                .onReceive(imageLoader.didChange) { data in
                    self.image = UIImage(data: data) ?? UIImage()
                }
        }else if(self.typeDisplay == "backgroundDisplay"){
            Image(uiImage: image)
                .resizable()
                .frame(maxWidth: .infinity, idealHeight: 200, maxHeight: 200, alignment: .center)
                .clipped()
                .onReceive(imageLoader.didChange) { data in
                    self.image = UIImage(data: data) ?? UIImage()
                }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(withURL: "https://www.journaldugeek.com/content/uploads/2020/11/deadpool.jpg", type: "")
    }
}

import Foundation
import Combine

/// Load an image from an url or from cache (code adapted from Exensions/UIImageView+Cache.swift)


class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(urlString:String, cache: URLCache? = nil) {
        let cache = cache ?? URLCache.shared
        let request = URLRequest(url: URL(string: urlString)!)
        if let data = cache.cachedResponse(for: request)?.data {
            DispatchQueue.main.async {
                self.data = data
            }
        } else {
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data, let response = response, ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300 {
                    let cachedData = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cachedData, for: request)
                    DispatchQueue.main.async {
                        self.data = data
                    }
                    
                }
            }).resume()
        }
    }
}
extension UIImageView {
    /// Loads image from web asynchronosly and caches it, in case you have to load url
    /// again, it will be loaded from cache if available
    func load(url: URL, placeholder: UIImage?, cache: URLCache? = nil) {
        let cache = cache ?? URLCache.shared
        let request = URLRequest(url: url)
        if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
            DispatchQueue.main.async {
                self.image = image
            }
        } else {
            self.image = placeholder
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data, let response = response, ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300, let image = UIImage(data: data) {
                    let cachedData = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cachedData, for: request)
                    DispatchQueue.main.async {
                        self.image = image
                    }
                    
                }
            }).resume()
        }
    }
}
