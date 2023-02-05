//
//  News.swift
//  intro-lab-rzamolotov
//
//  Created by Роман Замолотов on 03.02.2023.
//

import Foundation

struct News: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
} //MARK: Модель данных получаемых для заголовков новостей

struct NewsEnvelope: Decodable {
    let status: String
    let totalResults: Int
    let articles: [News]
}



