//
//  DetailViewController.swift
//  intro-lab-rzamolotov
//
//  Created by Роман Замолотов on 05.02.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var viewModel = NewsListViewModel()
    
    private lazy var detailNewsView: DetailNewsView = {
        let view = DetailNewsView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(detailNewsView)
    }
}
