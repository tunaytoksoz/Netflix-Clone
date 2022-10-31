//
//  UpcomingViewController.swift
//  Netflix Clone
//
//  Created by Tunay Toksöz on 29.10.2022.
//

import UIKit

class UpcomingViewController: UIViewController {
    
    private var titles : [Title] = [Title]()
    
    private let UpcomingTable: UITableView = {
        let tableView = UITableView()
        tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
       return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.largeTitleDisplayMode = .always
       
        view.addSubview(UpcomingTable)
        
        UpcomingTable.delegate = self
        UpcomingTable.dataSource = self
        FetchUpcoming()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        UpcomingTable.frame = view.bounds
    }
    
    private func FetchUpcoming(){
        APICaller.shared.getUpComingMovies { result in
            switch result{
            case .success(let titles):
                self.titles = titles
                DispatchQueue.main.async {
                    self.UpcomingTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

extension UpcomingViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
            return UITableViewCell()
        }
        let title = titles[indexPath.row]
        cell.configure(with: TitleViewModel(titleName: title.originalName ?? title.originalTitle ?? "Unkown Title name", PosterURL: title.posterPath ?? ""))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
