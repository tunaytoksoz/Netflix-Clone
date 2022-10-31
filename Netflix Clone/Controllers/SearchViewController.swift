//
//  SearchViewController.swift
//  Netflix Clone
//
//  Created by Tunay Toksöz on 29.10.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var titles : [Title] = [Title]()
    
    private let discoverTable: UITableView = {
        let tableView = UITableView()
        tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
       return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.largeTitleDisplayMode = .always
        
        view.addSubview(discoverTable)
        discoverTable.delegate = self
        discoverTable.dataSource = self
        
        fetchDiscover()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        discoverTable.frame = view.bounds
    }
    
    private func fetchDiscover(){
        APICaller.shared.getDiscover { [weak self] result in
            switch result{
            case .success(let titles):
                self?.titles = titles
                DispatchQueue.main.async {
                    self?.discoverTable.reloadData()
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    



}


extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
            return UITableViewCell()
        }
        
        let title = titles[indexPath.row]
        let model = TitleViewModel(titleName: title.originalName ?? title.originalTitle ?? "Unkown Title name", PosterURL: title.posterPath ?? "")
        cell.configure(with: model)
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
    
}

