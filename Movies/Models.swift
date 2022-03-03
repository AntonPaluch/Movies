//
//  Models.swift
//  Movies
//
//  Created by Pandos on 18.02.2022.
//

import Foundation

///  Название фильма +
///  cover.id - фото фильма +
///  Жанр фильма +
///  дата создания - created_at в формате dd.mm.yy +
///  доступные языки для просмотра +

struct Content: Decodable {
    let content: [GenreElement]
}

struct GenreElement: Decodable {
    let title: Title
    let content: [Films]
}

struct Films: Decodable {
    let title: String
    let cover: Cover
    let created_at: String
    let languages: [Language]
}

struct Cover: Decodable {
    let id: String
    
    var imageURL: URL? {
        URL(string: "https://www.signalmediacorp.com/b/c/\(id).jpg")
    }
}

struct Language: Decodable {
    let title: String
}

enum Title: String, Codable, CaseIterable {
    case animation = "Animation "
    case docsFactual = "Docs & factual"
    case drama = "Drama"
    case featureFilms = "Feature films"
    case theatralicalDistribution = "Theatralical distribution"
    
}

