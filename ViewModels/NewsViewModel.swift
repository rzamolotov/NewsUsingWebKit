//
//  NewsViewModel.swift
//  intro-lab-rzamolotov
//
//  Created by Роман Замолотов on 04.02.2023.
//

import Foundation

struct NewsViewModel {
    let news: News
    
    var author: String {
        return news.author ?? "Unknow"
    }
    
    var title: String {
        return news.title ?? ""
    }
    
    var description: String {
        return news.description ?? ""
    }
    
    var url: String {
        return news.url ?? ""
    }
    
    var urlToImage: String {
        return news.urlToImage ?? "https://acdn.tinkoff.ru/static/documents/513f36a0-d533-4240-902c-86f082781f41.png"
    }
    
    var publishedAt: String? {
        return news.publishedAt ?? ""
    }
}
