//
//  CitySelectViewController.swift
//  ARs
//
//  Created by Nuradinov Adil on 02/05/23.
//

import UIKit

class CitySelectViewController: UIViewController {
    
    private let wholeView = UIView()
    
    private let cities = Constants.Values.cities
    
    private lazy var citySearchBar: UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.searchBarStyle = .default
        searchBar.placeholder = "Search city that you need"
        return searchBar
    }()
    
    private lazy var cityTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.cityTableViewCell)
        tableView.layer.cornerRadius = 20
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
        
        cityTableView.dataSource = self
        cityTableView.delegate = self
    }
}

extension CitySelectViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.cityTableViewCell, for: indexPath) as! CityTableViewCell
        cell.setNameToCity(with: cities[indexPath.row])
        return cell
    }
}

extension CitySelectViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = view.frame.size.height * 0.06
        return CGFloat(height)
    }
}

private extension CitySelectViewController {
    func setupViews() {
        view.addSubview(wholeView)
        wholeView.addSubview(citySearchBar)
        wholeView.addSubview(cityTableView)
    }
    
    func setupConstraints() {
        wholeView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview()
        }
        citySearchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.05)
        }
        citySearchBar.searchTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        cityTableView.snp.makeConstraints { make in
            make.top.equalTo(citySearchBar.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.6)
        }
    }
}
