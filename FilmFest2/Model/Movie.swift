//
//  Movie.swift
//  FilmFest2
//
//  Created by Venkat Rao Manavarthi on 10/16/23.
//

import Foundation
struct Movie: Equatable {
    var title: String
    var releaseDate: String?
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.title == rhs.title && (lhs.releaseDate ?? "") == (rhs.releaseDate ?? "")
    }
}
