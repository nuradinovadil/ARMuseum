//
//  HomeViewController.swift
//  ARs
//
//  Created by Nuradinov Adil on 14/04/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var wholeView = UIView()
    private lazy var scrollView = UIScrollView()
    
    let museums = Constants.museums
    
//    var apiCaller = APIManager()
    
    private lazy var logoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "logoArs")
        return imageView
    }()
    
    private lazy var citySelectButton: UIButton = {
       let button = UIButton()
        button.setTitle("Select city", for: .normal)
//        button.setTitle("Trento", for: .selected)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .init(red: 116/255, green: 0, blue: 40/255, alpha: 1)
        button.addTarget(self, action: #selector(goToCitySelection), for: .touchUpInside)
        return button
    }()
    
    @objc func goToCitySelection() {
        let controller = CitySelectViewController()
        present(controller, animated: true)
    }
    
    private lazy var eventSearchBar: UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.layer.cornerRadius = 10
        searchBar.clipsToBounds = true
        searchBar.barStyle = .default
        searchBar.placeholder = "What event are you looking for"
        searchBar.backgroundColor = .white
        searchBar.resignFirstResponder()
        return searchBar
    }()
    
    private lazy var collectionTitleLabel: UILabel = {
       let label = UILabel()
        label.text = "All museums in your city"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
//    private lazy var eventCollectionView: UICollectionView = {
//       let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.eventCollectionViewCell)
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.backgroundColor = .clear
//        return collectionView
//    }()
//
//    private lazy var popularLabel: UILabel = {
//       let label = UILabel()
//        label.text = "Popular events🔥"
//        label.font = UIFont.boldSystemFont(ofSize: 20)
//        return label
//    }()
//
//    private lazy var typeOfEventCollectionView: UICollectionView = {
//       let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.register(TypeOfEventCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.typeOfEventCollectionViewCell)
//        collectionView.backgroundColor = .clear
//        collectionView.showsHorizontalScrollIndicator = false
//        return collectionView
//    }()
    
    private lazy var eventsTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(EventsTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.eventsTableViewCell)
        tableView.isScrollEnabled = false
        tableView.layer.cornerRadius = 15
        tableView.selectionFollowsFocus = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .init(red: 244/255, green: 244/255, blue: 249/255, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Home"
        
        setupViews()
        setupConstraints()
//        APIManager.shared.fetchAllItems()
        
        
//        eventCollectionView.dataSource = self
//        eventCollectionView.delegate = self
//        typeOfEventCollectionView.dataSource = self
//        typeOfEventCollectionView.delegate = self
        eventsTableView.dataSource = self
        eventsTableView.delegate = self
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == eventCollectionView {
//            return 10
//        }
        return TypesOfEvents.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == eventCollectionView {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.eventCollectionViewCell, for: indexPath) as! EventCollectionViewCell
//            cell.layer.cornerRadius = 20
//            cell.clipsToBounds = true
//            return cell
//        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.typeOfEventCollectionViewCell, for: indexPath) as! TypeOfEventCollectionViewCell
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth = 1
        cell.layer.borderColor = .init(red: 116/255, green: 0, blue: 40/255, alpha: 1)
        cell.backgroundColor = .white
        cell.setupNameOfEvent(with: TypesOfEvents.allCases[indexPath.row].rawValue)
        return cell
    }
}

//extension HomeViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == eventCollectionView {
//            let width = view.frame.size.width * 0.75
//            let height = view.frame.size.height * 0.45
//            return CGSize(width: width, height: height)
//        }
//        else if collectionView == typeOfEventCollectionView {
//            let label = UILabel()
//            label.text = "Music"
//            label.textAlignment = .center
//            label.sizeToFit()
//            label.textColor = .init(red: 116/255, green: 0, blue: 40/255, alpha: 1)
//            let height = view.frame.size.height * 0.05
//            return CGSize(width: label.frame.size.width + 50, height: height)
//        }
//        return CGSize(width: 30, height: 30)
//    }
//}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.eventsTableViewCell, for: indexPath) as! EventsTableViewCell
//        cell.layer.borderWidth = 1
//        cell.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        cell.setName(with: museums[indexPath.row])
        return cell
    }
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(view.frame.size.height * 0.39)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = MuseumDetailViewController()
        navigationController?.pushViewController(controller, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

private extension HomeViewController {
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(wholeView)
        wholeView.addSubview(logoImageView)
        wholeView.addSubview(citySelectButton)
        wholeView.addSubview(eventSearchBar)
        wholeView.addSubview(collectionTitleLabel)
//        wholeView.addSubview(eventCollectionView)
//        wholeView.addSubview(popularLabel)
//        wholeView.addSubview(typeOfEventCollectionView)
        wholeView.addSubview(eventsTableView)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.width.equalTo(view.snp.width)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        wholeView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.leading.trailing.equalTo(view).inset(15)
            make.bottom.equalTo(scrollView.snp.bottom)
            make.height.equalTo(view).multipliedBy(4.82)
        }
        logoImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.width.equalTo(view).multipliedBy(0.2)
            make.height.equalTo(logoImageView.snp.width)
        }
        citySelectButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(logoImageView.snp.trailing).offset(10)
            make.height.equalTo(view).multipliedBy(0.04)
        }
        eventSearchBar.snp.makeConstraints { make in
            make.top.equalTo(citySelectButton.snp.bottom).offset(7)
            make.trailing.equalToSuperview()
            make.leading.equalTo(logoImageView.snp.trailing).offset(10)
            make.height.equalTo(view).multipliedBy(0.04)
        }
        eventSearchBar.searchTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        collectionTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
        }
//        eventCollectionView.snp.makeConstraints { make in
//            make.top.equalTo(collectionTitleLabel.snp.bottom).offset(10)
//            make.leading.trailing.equalToSuperview()
//            make.height.equalTo(view).multipliedBy(0.45)
//        }
//        popularLabel.snp.makeConstraints { make in
//            make.top.equalTo(eventCollectionView.snp.bottom).offset(10)
//            make.leading.trailing.equalToSuperview()
//        }
//        typeOfEventCollectionView.snp.makeConstraints { make in
//            make.top.equalTo(popularLabel.snp.bottom).offset(10)
//            make.leading.trailing.equalToSuperview()
//            make.height.equalTo(view).multipliedBy(0.05)
//        }
        eventsTableView.snp.makeConstraints { make in
            make.top.equalTo(collectionTitleLabel.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
