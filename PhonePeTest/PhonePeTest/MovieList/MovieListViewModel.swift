//
//  MovieListViewModel.swift
//  PhonePeTest
//
//  Created by Ankush Gupta on 25/06/22.
//

import Foundation

final class MovieListViewModel{
    private(set) var allMovieList:[Movie] = []
    
    func getMovieData(completion: @escaping (Bool) -> Void) {
        if let path = Bundle.main.path(forResource: "movieData", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let movieList = try? JSONDecoder().decode(MovieList.self, from: data)
                if let movieListData = movieList?.results{
                    allMovieList = movieListData
                    completion(true)
                }
            } catch let error {
                print(error.localizedDescription)
            }}
    }
    
    
}
