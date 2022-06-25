//
//  ViewController.swift
//  PhonePeTest
//
//  Created by Ankush Gupta on 25/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    let listVM = MovieListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        listVM.getMovieData {[weak wSelf = self] isSuccess in
            if isSuccess{
                DispatchQueue.main.async {
                    wSelf?.tableView.reloadData()
                }
            }
        }
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listVM.allMovieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell", for: indexPath) as? MovieListTableViewCell
        cell?.showData(data: listVM.allMovieList[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieData = listVM.allMovieList[indexPath.row]
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController
        vc?.detailVM = MovieDetailViewModel(movieData: movieData)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

