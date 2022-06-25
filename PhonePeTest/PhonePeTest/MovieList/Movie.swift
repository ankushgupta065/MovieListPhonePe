//
//  Movie.swift
//  PhonePeTest
//
//  Created by Ankush Gupta on 25/06/22.
//

import Foundation

struct Movie: Codable{
    let original_title: String
    let overview: String
    let backdrop_path: String
    let poster_path: String
    let release_date: String
    let vote_average: Float
    let popularity: Float
}

struct MovieList: Codable{
    let results: [Movie]
}
