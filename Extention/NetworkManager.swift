//
//  NetworkManager.swift
//  intro-lab-rzamolotov
//
//  Created by Роман Замолотов on 03.02.2023.
//

import Foundation

class NetworkManager {
    let imageCache = NSCache<NSString, NSData>() // переменная для помещения изображений в кэш
    
    static let shared = NetworkManager()
    private init() {}
    
    private let baseURLString = "https://newsapi.org/v2/" // переменная для домена откуда новости будем брать
    private let topHeadline = "top-headlines?country=us" // переменная для полученяи новостей
    
    func getNews(completion: @escaping ([News]?) -> Void) {
        let urlString = "\(baseURLString)\(topHeadline)&apiKey=\(APIKey.key)"
        guard let url = URL(string: urlString) else {
            return
        } // URL новостей
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completion(nil)
                return
            } // блок получения ошибки
            
            let newsEnvelope = try? JSONDecoder().decode(NewsEnvelope.self, from: data)
            newsEnvelope == nil ? completion(nil) : completion(newsEnvelope!.articles)
        }.resume()
    }// функция получения новостей
    
    func getImage(urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        } // получаем изображение
        if let cacheImage = imageCache.object(forKey: NSString(string: urlString)) {
            completion(cacheImage as Data) // ищем изображение из кэша
        } else {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil, let data = data else {
                    completion(nil)
                    return
                } // если не находим изображение в кэше - вызов загрузки изображения из урл
                
                self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                completion(data)
                
            }.resume()
        }
    } // функция получения изображения
}
