//
//  NewsListViewModel.swift
//  intro-lab-rzamolotov
//
//  Created by Роман Замолотов on 04.02.2023.
//

import Foundation

class NewsListViewModel {
    
    var newsViewModel = [NewsViewModel]()
    
    let reuseID = "news"
    
    func getNews(completition: @escaping ([NewsViewModel]) -> Void) {
        NetworkManager.shared.getNews { (news) in
            guard let news = news else { return }
            let newsViewModel = news.map(NewsViewModel.init)
            DispatchQueue.main.async {
                self .newsViewModel = newsViewModel
                completition(newsViewModel)
            }
        }
    }
}
