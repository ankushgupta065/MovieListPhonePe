//
//  MovieDetailViewController.swift
//  PhonePeTest
//
//  Created by Ankush Gupta on 25/06/22.
//

import UIKit

final class MovieDetailViewController: UIViewController {
    
    @IBOutlet private weak var imgMovie: UIImageView!
    @IBOutlet private weak var lblReleaseDateValue: UILabel!
    @IBOutlet private weak var lblRatingValue: UILabel!
    @IBOutlet private weak var lblPopularityValue: UILabel!
    @IBOutlet private weak var lblOverviewText: UILabel!
    var detailVM = MovieDetailViewModel()
    let baseUrl = "https://image.tmdb.org/t/p/w500"

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()

        // Do any additional setup after loading the view.
    }
    
    private func setUI(){
        if let movieData = detailVM.movieDetail{
            self.title = movieData.original_title
            imgMovie.loadThumbnail(urlSting: baseUrl + movieData.poster_path)
            lblReleaseDateValue.text = movieData.release_date
            lblRatingValue.text = String(format: "%.2f", movieData.vote_average)
            lblPopularityValue.text = String(format: "%.2f", movieData.popularity)
            lblOverviewText.text = movieData.overview
        }
        
    }

}
