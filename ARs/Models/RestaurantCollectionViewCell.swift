//
//  RestaurantCollectionViewCell.swift
//  ARs
//
//  Created by Nuradinov Adil on 26/05/23.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    
    private lazy var restaurantImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "shi")
        imageView.sizeToFit()
        return imageView
    }()
    
    private lazy var restaurantNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Shi's Trento Restorante"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var restaurantPriceLabel: UILabel = {
        let label = UILabel()
         label.text = " $10-20 "
         label.font = UIFont.boldSystemFont(ofSize: 16)
        label.backgroundColor = .white
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
         return label
    }()
    
    private lazy var restaurantRankLabel: UILabel = {
        let label = UILabel()
         label.text = "4.7"
         label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var starImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .systemYellow
        return imageView
    }()
    
    private lazy var restaurantNumberOfRanksLabel: UILabel = {
        let label = UILabel()
         label.text = "(1 876)"
         label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .systemGray
        return label
    }()
    
    func setImageAndName(with name: String, image: String, averageReview: Double, numberReviews: Int) {
        restaurantNameLabel.text = "\(name)"
        restaurantImageView.image = UIImage(named: "\(image)")
        restaurantRankLabel.text = "\(averageReview)"
        restaurantNumberOfRanksLabel.text = "(\(numberReviews))"
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension RestaurantCollectionViewCell {
    func setupViews() {
        contentView.addSubview(restaurantImageView)
        contentView.addSubview(restaurantNameLabel)
        contentView.addSubview(restaurantPriceLabel)
        contentView.addSubview(restaurantRankLabel)
        contentView.addSubview(starImageView)
        contentView.addSubview(restaurantNumberOfRanksLabel)
    }
    func setupConstraints() {
        restaurantImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(contentView).multipliedBy(0.5)
        }
        restaurantNameLabel.snp.makeConstraints { make in
            make.top.equalTo(restaurantImageView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview()
        }
        restaurantPriceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(restaurantImageView.snp.bottom).offset(-5)
            make.trailing.equalToSuperview().inset(5)
        }
        restaurantRankLabel.snp.makeConstraints { make in
            make.top.equalTo(restaurantNameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(12)
        }
        starImageView.snp.makeConstraints { make in
            make.centerY.equalTo(restaurantRankLabel.snp.centerY)
            make.height.equalTo(restaurantRankLabel.snp.height)
            make.leading.equalTo(restaurantRankLabel.snp.trailing).offset(7)
        }
        restaurantNumberOfRanksLabel.snp.makeConstraints { make in
            make.centerY.equalTo(restaurantRankLabel.snp.centerY)
            make.leading.equalTo(starImageView.snp.trailing).offset(7)
        }
    }
}
