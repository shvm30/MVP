//
//  NetworkService.swift
//  MVP
//
//  Created by Владимир on 05.09.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData(complition: @escaping(Result<[Posts], Error>) -> Void)
    func getUrl() -> URL?
    
}

final class NetworkService: NetworkServiceProtocol {
    func getUrl() -> URL? {
        let strUrl = "https://jsonplaceholder.typicode.com/posts"
        let url = URL(string: strUrl)
        return url
    }
    func fetchData(complition: @escaping(Result<[Posts], Error>) -> Void) {
        guard let url = getUrl() else {
            complition(.failure(NetworkServiceErrors.invalidUrl))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                return complition(.failure(NetworkServiceErrors.invalidRequest))
            }
            guard let data = data else {
                complition(.failure(NetworkServiceErrors.invalidData))
                return
            }
            do {
                let posts = try JSONDecoder().decode([Posts].self, from: data)
                    complition(.success(posts))

            }catch {
                    complition(.failure(NetworkServiceErrors.inavalidDecode))
                print(NetworkServiceErrors.invalidData)
                }
        }.resume()
    }
}

enum NetworkServiceErrors: Error {
    case invalidUrl, invalidData, inavalidDecode, invalidRequest
}
