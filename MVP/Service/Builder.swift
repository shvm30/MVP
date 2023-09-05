//
//  Builder.swift
//  MVP
//
//  Created by Владимир on 05.09.2023.
//

import UIKit

protocol Builder {
    static func createMain() -> UIViewController
}
 class ModulBuilder: Builder {
    static func createMain() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
}
