//
//  HotelCollectionViewCell.swift
//  ARs
//
//  Created by Nuradinov Adil on 26/05/23.
//

import UIKit

class HotelCollectionViewCell: UICollectionViewCell {
    
    private lazy var hotelImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "everest")
        imageView.sizeToFit()
        return imageView
    }()
    
    private lazy var hotelNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Hotel Everest con Restorante"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 2
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var hotelPriceLabel: UILabel = {
        let label = UILabel()
         label.text = " $134 "
         label.font = UIFont.boldSystemFont(ofSize: 16)
        label.backgroundColor = .white
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
         return label
    }()
    
    private lazy var hotelRankLabel: UILabel = {
        let label = UILabel()
         label.text = "4.0"
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
    
    private lazy var hotelNumberOfRanksLabel: UILabel = {
        let label = UILabel()
         label.text = "(2 051)"
         label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .systemGray
        return label
    }()
    
    func setImageAndName(with name: String, image: String, averageReview: Double, numberReviews: Int, price: Int) {
        hotelNameLabel.text = "\(name)"
        hotelImageView.image = UIImage(named: "\(image)")
        hotelRankLabel.text = "\(averageReview)"
        hotelNumberOfRanksLabel.text = "(\(numberReviews))"
        hotelPriceLabel.text = " $\(price) "
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

private extension HotelCollectionViewCell {
    func setupViews() {
        contentView.addSubview(hotelImageView)
        contentView.addSubview(hotelNameLabel)
        contentView.addSubview(hotelPriceLabel)
        contentView.addSubview(hotelRankLabel)
        contentView.addSubview(starImageView)
        contentView.addSubview(hotelNumberOfRanksLabel)
    }
    func setupConstraints() {
        hotelImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(contentView).multipliedBy(0.5)
        }
        hotelNameLabel.snp.makeConstraints { make in
            make.top.equalTo(hotelImageView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview()
        }
        hotelPriceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(hotelImageView.snp.bottom).offset(-5)
            make.trailing.equalToSuperview().inset(5)
        }
        hotelRankLabel.snp.makeConstraints { make in
            make.top.equalTo(hotelNameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(12)
        }
        starImageView.snp.makeConstraints { make in
            make.centerY.equalTo(hotelRankLabel.snp.centerY)
            make.height.equalTo(hotelRankLabel.snp.height)
            make.leading.equalTo(hotelRankLabel.snp.trailing).offset(7)
        }
        hotelNumberOfRanksLabel.snp.makeConstraints { make in
            make.centerY.equalTo(hotelRankLabel.snp.centerY)
            make.leading.equalTo(starImageView.snp.trailing).offset(7)
        }
    }
}
