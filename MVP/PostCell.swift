//
//  PostCell.swift
//  MVP
//
//  Created by Владимир on 05.09.2023.
//

import UIKit

class PostCell: UITableViewCell {
    
    lazy var cellPostLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var stackView:UIStackView = {
       let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 30
        stackView.axis = .horizontal
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        congigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func congigure() {
        contentView.addSubview(cellPostLabel)
        cellPostLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        cellPostLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5).isActive = true
        cellPostLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        cellPostLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5).isActive = true

    }
}
