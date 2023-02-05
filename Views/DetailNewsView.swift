//
//  DetailNewsView.swift
//  intro-lab-rzamolotov
//
//  Created by Роман Замолотов on 05.02.2023.
//

import UIKit

final class DetailNewsView: UITableViewCell {
    
    var newsViewModel: NewsViewModel? {
        didSet {
            if let newsViewModel = newsViewModel {
                titleLablel.text = newsViewModel.title
                descriptionLabel.text = newsViewModel.description
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
    
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 10)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }
    
    func linkButton() {
        let button = UIButton(frame: CGRect(x: 20, y: 20, width: 200, height: 60))
        button.setTitle("See More", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped(sender : UIButton) {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(titleLablel)
        addSubview(newsImage)
        addSubview(descriptionLabel)
        
        setupConstrains()
    }
    
    func setupConstrains() {
        //title
        NSLayoutConstraint.activate([
            titleLablel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLablel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLablel.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 8),
            titleLablel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
        
        // news image
        NSLayoutConstraint.activate([
            newsImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsImage.topAnchor.constraint(equalTo: topAnchor),
            newsImage.heightAnchor.constraint(equalToConstant: 200)
        ])

        //description
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionLabel.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 8),
            
        ])
    }
}

