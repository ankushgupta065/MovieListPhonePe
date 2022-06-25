//
//  MovieDetailViewModel.swift
//  PhonePeTest
//
//  Created by Ankush Gupta on 25/06/22.
//

import Foundation

final class MovieDetailViewModel{
    private(set) var movieDetail: Movie?
    
    init(){}
    
    init(movieData: Movie) {
        movieDetail = movieData
    }
}
