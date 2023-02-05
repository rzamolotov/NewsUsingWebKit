//
//  NewsTableViewCell.swift
//  intro-lab-rzamolotov
//
//  Created by Роман Замолотов on 04.02.2023.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {
    
    var newsViewModel: NewsViewModel? {
        didSet {
            if let newsViewModel = newsViewModel {
                titleLablel.text = newsViewModel.title
                dateLabel.text = newsViewModel.publishedAt
                NetworkManager.shared.getImage(urlString: newsViewModel.urlToImage) { (data) in
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                        self.newsImage.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    
    var newsImageData: Data? {
        didSet {
            if let data = newsImageData {
                newsImage.image = UIImage(data: data)
                
            }
        }
    }
    
    private lazy var newsImage: ShadowImageView = {
        let view = ShadowImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    
    private lazy var titleLablel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }
    
    private lazy var dateLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 10)
        view.textColor = .gray
        return view
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(titleLablel)
        addSubview(newsImage)
        addSubview(dateLabel)
        
        setupConstrains()
    }
    
    func setupConstrains() {
        // news image
        NSLayoutConstraint.activate([
            newsImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsImage.topAnchor.constraint(equalTo: topAnchor),
            newsImage.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        //title
        NSLayoutConstraint.activate([
            titleLablel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLablel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLablel.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 8),
            titleLablel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
        
        //date
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dateLabel.topAnchor.constraint(equalTo: titleLablel.bottomAnchor, constant: 2)
        ])
    }
}

