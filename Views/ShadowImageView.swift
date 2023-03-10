//
//  ShadowImageView.swift
//  intro-lab-rzamolotov
//
//  Created by Роман Замолотов on 04.02.2023.
//

import UIKit

final class ShadowImageView: UIView {
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 20
        view.clipsToBounds  = true
        return view
    }()
    
    private lazy var baseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowOpacity = 0.7
        view.layer.shadowRadius = 10.0
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(baseView)
        baseView.addSubview(imageView)
        
        setupConstrains()
    }
    
    func setupConstrains() {
        [baseView, imageView].forEach { (view) in
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                view.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
            ])
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        baseView.layer.shadowPath = UIBezierPath(roundedRect: baseView.bounds, cornerRadius: 10).cgPath
        baseView.layer.shouldRasterize = true
        baseView.layer.rasterizationScale = UIScreen.main.scale
    }
}
