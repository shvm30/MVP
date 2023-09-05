//
//  ViewController.swift
//  MVP
//
//  Created by Владимир on 05.09.2023.
//

import UIKit

class MainViewController: UIViewController {

    var presenter: MainViewPresenter!
    
   //MARK: Ui elements
    
    private lazy var postsTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.register(PostCell.self, forCellReuseIdentifier: "PostsCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstr()

    }
    
    //MARK: Private Methods
    
    private func setViews() {
        view.addSubview(postsTableView)
    }
    private func setConstr() {
        postsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        postsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        postsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        postsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
}

//MARK: Extensions

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsCell", for: indexPath) as? PostCell
        cell?.cellPostLabel.text = presenter.posts?[indexPath.row].title
        return cell ?? UITableViewCell()
    }
}
extension MainViewController: MainViewProtocol {
    func succes() {
        postsTableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
