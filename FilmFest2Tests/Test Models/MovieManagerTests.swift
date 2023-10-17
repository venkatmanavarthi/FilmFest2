//
//  MovieManagerTests.swift
//  FilmFest2Tests
//
//  Created by Venkat Rao Manavarthi on 10/17/23.
//

import XCTest
@testable import FilmFest2

final class MovieManagerTests: XCTestCase {
    
    var sut: MovieManager!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK: - Initial Tests
    func testInit_MoviesToSee_ReturnsZero(){
        XCTAssertEqual(sut.moviesWatched, 0)
    }
    
    func testInit_MoviesSeen_ReturnsZero(){
        XCTAssertEqual(sut.moviesNeedToWatch, 0)
    }
    
    //MARK: - Add
    func testAdd_MoviesToSee_ReturnsOne(){
        let testMovie = Movie(title: "Test Add Movie")
        sut.addMovie(movie: testMovie)
        XCTAssertEqual(sut.moviesNeedToWatch, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex(){
        let testMovie = Movie(title: "Test Add Movie")
        sut.addMovie(movie: testMovie)
        let movie : Movie = sut.queryMovieAt(index: 0)
        XCTAssertEqual(movie.title, testMovie.title)
    }
    
    func testCheckOffMovie_UpdatesCount(){
        let testMovie = Movie(title: "Test Add Movie")
        sut.addMovie(movie: testMovie)
        sut.checkOffMovieAt(index: 0)
        XCTAssertEqual(sut.moviesNeedToWatch, 0)
        XCTAssertEqual(sut.moviesWatched, 1)
    }
    
    func testCheckOffMovie_RemovesFromArray(){
        let testMovie = Movie(title: "Test Add Movie")
        sut.addMovie(movie: Movie(title: "Movie"))
        sut.addMovie(movie: testMovie)
        sut.checkOffMovieAt(index: 0)
        XCTAssertEqual(sut.queryMovieAt(index: 0).title, testMovie.title)
    }
    
    func testCheckedOffMovie_ReturnsCheckMovie(){
        let testMovie = Movie(title: "Test Add Movie")
        sut.addMovie(movie: testMovie)
        sut.checkOffMovieAt(index: 0)
        let movie : Movie = sut.checkedOffMovieAt(index: 0)
        XCTAssertEqual(movie.title, testMovie.title)
    }
    
    func testEquitable_ReturnsTrue(){
        let movie1 = Movie(title: "Test Add Movie")
        let movie2 = Movie(title: "Test Add Movie")
        XCTAssertEqual(movie1, movie2)
    }
    
    func testEquitable_ReturnsNotEqualForDifferentTitles(){
        let movie1 = Movie(title: "Test Add Movie")
        let movie2 = Movie(title: "Add Movie")
        XCTAssertNotEqual(movie1, movie2)
    }
    
    func testEquitable_ReturnsNotEqualForDifferentDates(){
        let movie1 = Movie(title: "Test Add Movie", releaseDate: "1900")
        let movie2 = Movie(title: "Add Movie", releaseDate: "1910")
        XCTAssertNotEqual(movie1, movie2)
    }
    
    func testClearArrays_ReturnsArrayCountOfZero(){
        let movie1 = Movie(title: "Test Add Movie", releaseDate: "1900")
        let movie2 = Movie(title: "Add Movie", releaseDate: "1910")
        sut.addMovie(movie: movie1)
        sut.addMovie(movie: movie2)
        sut.checkOffMovieAt(index: 0)
        XCTAssertEqual(sut.moviesNeedToWatch, 1)
        XCTAssertEqual(sut.moviesWatched, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesNeedToWatch, 0)
        XCTAssertEqual(sut.moviesWatched, 0)
    }
    
    func testDuplicates_ReturnsDuplicatesShouldNotBeAdded(){
        let movie1 = Movie(title: "Test Add Movie", releaseDate: "1900")
        let movie2 = Movie(title: "Test Add Movie", releaseDate: "1900")
        sut.addMovie(movie: movie1)
        sut.addMovie(movie: movie2)
        XCTAssertEqual(sut.moviesNeedToWatch, 1)
    }
}

