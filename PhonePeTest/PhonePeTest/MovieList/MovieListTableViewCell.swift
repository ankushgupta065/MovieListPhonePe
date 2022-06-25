//
//  MovieListTableViewCell.swift
//  PhonePeTest
//
//  Created by Ankush Gupta on 25/06/22.
//

import UIKit

final class MovieListTableViewCell: UITableViewCell {
    @IBOutlet private weak var imgMovie: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descLabel: UILabel!
    private let baseUrl = "https://image.tmdb.org/t/p/w500"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func showData(data: Movie){
        titleLabel.text = data.original_title
        descLabel.text = data.overview
        let thumbnailUrl = baseUrl + data.backdrop_path
        imgMovie.loadThumbnail(urlSting: thumbnailUrl)
    }

}
