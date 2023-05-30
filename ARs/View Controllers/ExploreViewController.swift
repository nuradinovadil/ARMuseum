//
//  ExploreViewController.swift
//  ARs
//
//  Created by Nuradinov Adil on 26/05/23.
//

import UIKit

class ExploreViewController: UIViewController {
    
    let wholeView = UIView()
    let scrollView = UIScrollView()
    let hotelNames = Constants.hotels
    let hotelImages = Constants.hotelImages
    let avgReview = Constants.hotelRanks
    let numRanks = Constants.numberOfReviews
    let hotelPrice = Constants.hotelPrices
    let restNames = Constants.restaurants
    let restImages = Constants.restImages
    let authors = Constants.authorName
    let avatars = Constants.authorAvatar
    let posts = Constants.post
    let postContent = Constants.postContent
    
    private lazy var firstLabel: UILabel = {
       let label = UILabel()
        label.text = "Latest in the area"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    private lazy var secondLabel: UILabel = {
       let label = UILabel()
        label.text = "Hotels nearby"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var thirdLabel: UILabel = {
       let label = UILabel()
        label.text = "Prices for tonight"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var hotelsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HotelCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.hotelCollectionViewCell)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var fourthLabel: UILabel = {
       let label = UILabel()
        label.text = "Restaurants and cafes nearby"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var fifthLabel: UILabel = {
       let label = UILabel()
        label.text = "Avarage price per person"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var restaurantsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.restaurantCollectionViewCell)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var reviewsTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(ReviewsTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.reviewsTableViewCell)
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()

        view.backgroundColor = .init(red: 244/255, green: 244/255, blue: 249/255, alpha: 1)
        
        hotelsCollectionView.dataSource = self
        hotelsCollectionView.delegate = self
        restaurantsCollectionView.dataSource = self
        restaurantsCollectionView.delegate = self
        reviewsTableView.dataSource = self
        reviewsTableView.delegate = self
    }

}

extension ExploreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.reviewsTableViewCell, for: indexPath) as! ReviewsTableViewCell
        cell.backgroundColor = .white
        cell.createPost(author: authors[indexPath.row], avatar: avatars[indexPath.row], post: posts[indexPath.row], postContent: postContent[indexPath.row], restaurant: restNames[indexPath.row])
        return cell
    }
}

extension ExploreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = view.frame.size.height * 0.7
        return CGFloat(height)
    }
}

extension ExploreViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == hotelsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.hotelCollectionViewCell, for: indexPath) as! HotelCollectionViewCell
            cell.backgroundColor = .white
            cell.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.3)
            cell.layer.borderWidth = 0.3
            cell.layer.cornerRadius = 10
            cell.setImageAndName(with: hotelNames[indexPath.row], image: hotelImages[indexPath.row], averageReview: avgReview[indexPath.row], numberReviews: numRanks[indexPath.row], price: hotelPrice[indexPath.row])
            cell.clipsToBounds = true
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.restaurantCollectionViewCell, for: indexPath) as! RestaurantCollectionViewCell
        cell.backgroundColor = .white
        cell.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.3)
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10
        cell.setImageAndName(with: restNames[indexPath.row], image: restImages[indexPath.row], averageReview: avgReview[indexPath.row], numberReviews: numRanks[indexPath.row])
        cell.clipsToBounds = true
        return cell
    }
}

extension ExploreViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = view.frame.size.height * 0.25
        let width = view.frame.size.width * 0.4
        return CGSize(width: width, height: height)
    }
}

private extension ExploreViewController {
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(wholeView)
        wholeView.addSubview(hotelsCollectionView)
        wholeView.addSubview(firstLabel)
        wholeView.addSubview(secondLabel)
        wholeView.addSubview(thirdLabel)
        wholeView.addSubview(fourthLabel)
        wholeView.addSubview(fifthLabel)
        wholeView.addSubview(restaurantsCollectionView)
        wholeView.addSubview(reviewsTableView)
    }
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        wholeView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.leading.trailing.equalTo(view).inset(15)
            make.bottom.equalTo(scrollView.snp.bottom)
            make.height.equalTo(view).multipliedBy(3)
        }
        firstLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
        }
        thirdLabel.snp.makeConstraints { make in
            make.top.equalTo(secondLabel.snp.bottom).offset(7)
            make.leading.trailing.equalToSuperview()
        }
        hotelsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(thirdLabel.snp.bottom).offset(7)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.27)
        }
        fourthLabel.snp.makeConstraints { make in
            make.top.equalTo(hotelsCollectionView.snp.bottom).offset(15)
            make.leading.equalToSuperview()
        }
        fifthLabel.snp.makeConstraints { make in
            make.top.equalTo(fourthLabel.snp.bottom).offset(7)
        }
        restaurantsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(fifthLabel.snp.bottom).offset(7)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.27)
        }
        reviewsTableView.snp.makeConstraints { make in
            make.top.equalTo(restaurantsCollectionView.snp.bottom).offset(15)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
