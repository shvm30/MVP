//
//  Presenter.swift
//  MVP
//
//  Created by Владимир on 05.09.2023.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}
protocol MainViewPresenter: AnyObject {
    var posts: [Posts]? { get set }
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getPosts()
}

class MainPresenter: MainViewPresenter {
  
    weak var view: MainViewProtocol!
    let networkService: NetworkServiceProtocol!
    var posts: [Posts]?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getPosts()
    }
    
    func getPosts() {
        networkService.fetchData { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                    self.posts = posts
                    self.view.succes()
                case .failure(let error):
                    self.view.failure(error: error)
            }
            }
        }
    }
}
