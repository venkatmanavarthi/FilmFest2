//
//  MovieManager.swift
//  FilmFest2
//
//  Created by Venkat Rao Manavarthi on 10/17/23.
//

import Foundation
struct MovieManager {
    var moviesWatched: Int {return self.checkedOffMovie.count}
    var moviesNeedToWatch: Int {return self.movieArray.count}
    private var movieArray : Array<Movie> = []
    private var checkedOffMovie : Array<Movie> = []
    
    init() {
    }
    
    mutating func addMovie(movie: Movie){
        if !self.movieArray.contains(movie){
            self.movieArray.append(movie)
        }
    }
    
    func queryMovieAt(index: Int) -> Movie {
        return self.movieArray[index]
    }
    
    mutating func checkOffMovieAt(index: Int){
        guard index < self.moviesNeedToWatch else {return}
        self.checkedOffMovie.append(self.movieArray.remove(at: index))
    }
    
    func checkedOffMovieAt(index: Int) -> Movie{
        return self.checkedOffMovie[index]
    }
    
    mutating func clearArrays(){
        self.movieArray.removeAll()
        self.checkedOffMovie.removeAll()
    }
}
