//
//  HeaderView.swift
//  intro-lab-rzamolotov
//
//  Created by Роман Замолотов on 04.02.2023.
//

import UIKit

final class HeaderView: UIView {
    
    private var fontSize: CGFloat
    
    private lazy var headingLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "News App Rzamolotov Tinkoff"
        view.font = UIFont.boldSystemFont(ofSize: fontSize)
        return view
    }()
    
    private lazy var headerStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [headingLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        return view
    }()
    
    private lazy var subheadlineLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = view.font.withSize(fontSize)
        view.text = "Top News"
        view.textColor = .gray
        return view
    }()
    
    init(fontSize: CGFloat) {
        self.fontSize = fontSize
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(headerStackView)
        addSubview(subheadlineLabel)
        setupConstrains()
    }
    
    func setupConstrains() {
        //Header
        NSLayoutConstraint.activate([
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerStackView.topAnchor.constraint(equalTo: topAnchor),

        ])
        
        //Subheadline
        NSLayoutConstraint.activate([
            subheadlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            subheadlineLabel.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 0),
            subheadlineLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
}
