//
//  MovieStructTests.swift
//  FilmFest2Tests
//
//  Created by Venkat Rao Manavarthi on 10/16/23.
//

import XCTest
@testable import FilmFest2

final class MovieStructTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInit_MovieWithTitle(){
        let movie = Movie(title: "Some Movie Name")
        XCTAssertNotNil(movie)
        XCTAssertEqual(movie.title, "Some Movie Name")
    }
    
    func testInit_SetMovieTitleAndReleaseData(){
        let m = Movie(title: "J", releaseDate: "1997")
        XCTAssertNotNil(m)
        XCTAssertEqual(m.title, "J")
        XCTAssertEqual(m.releaseDate, "1997")
    }
}
