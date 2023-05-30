//
//  ReviewsTableViewCell.swift
//  ARs
//
//  Created by Nuradinov Adil on 26/05/23.
//

import UIKit

class ReviewsTableViewCell: UITableViewCell {
    
    let wholeView = UIView()
    
    private lazy var authorImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Mona Lisa")
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var authorName: UILabel = {
       let label = UILabel()
        label.text = "Alberto Armani"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var postImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "aperol")
        imageView.layer.cornerRadius = 14
        imageView.sizeToFit()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var postDesc: UILabel = {
       let label = UILabel()
        label.text = "I recently had the pleasure of dining, and one of the highlights of my visit was trying their Aperol cocktail. As a fan of vibrant and zesty flavors, I couldn't resist indulging in this classic Italian aperitif. Let me share my delightful experience!"
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 6
        return label
    }()
    
    private lazy var restaurantView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 14
        view.backgroundColor = .clear
//        view.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
//        view.layer.borderWidth = 1
        return view
    }()
    
    private lazy var restaurantNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Shi's Trento Restorante"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var restRankLabel: UILabel = {
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
    
    private lazy var firstLabel: UILabel = {
        let label = UILabel()
         label.text = " Restaurant  -  $  "
         label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .systemGray
        return label
    }()
    
    func createPost(author: String, avatar: String, post: String, postContent:String, restaurant: String) {
        authorName.text = "\(author)"
        authorImage.image = UIImage(named: "\(avatar)")
        postImage.image = UIImage(named: "\(post)")
        postDesc.text = "\(postContent)"
        restaurantNameLabel.text = "\(restaurant)"
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        
        restaurantView.layer.borderWidth = 0.4
        restaurantView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension ReviewsTableViewCell {
    func setupViews() {
        contentView.addSubview(wholeView)
        wholeView.addSubview(authorImage)
        wholeView.addSubview(authorName)
        wholeView.addSubview(postImage)
        wholeView.addSubview(postDesc)
        contentView.addSubview(restaurantView)
        restaurantView.addSubview(restaurantNameLabel)
        restaurantView.addSubview(restRankLabel)
        restaurantView.addSubview(starImageView)
        restaurantView.addSubview(firstLabel)
    }
    func setupConstraints() {
        wholeView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.trailing.equalToSuperview().inset(15)
        }
        authorImage.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.width.equalTo(contentView).multipliedBy(0.115)
            make.height.equalTo(authorImage.snp.width)
        }
        authorName.snp.makeConstraints { make in
            make.centerY.equalTo(authorImage.snp.centerY)
            make.leading.equalTo(authorImage.snp.trailing).offset(15)
        }
        postImage.snp.makeConstraints { make in
            make.top.equalTo(authorName.snp.bottom).offset(25)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(contentView).multipliedBy(0.45)
        }
        postDesc.snp.makeConstraints { make in
            make.top.equalTo(postImage.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
        }
        restaurantView.snp.makeConstraints { make in
            make.top.equalTo(postDesc.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().offset(-20)
        }
        restaurantNameLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview()
        }
        restRankLabel.snp.makeConstraints { make in
            make.top.equalTo(restaurantNameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        starImageView.snp.makeConstraints { make in
            make.centerY.equalTo(restRankLabel.snp.centerY)
            make.leading.equalTo(restRankLabel.snp.trailing).offset(10)
        }
        firstLabel.snp.makeConstraints { make in
            make.centerY.equalTo(restRankLabel.snp.centerY)
            make.leading.equalTo(starImageView.snp.trailing).offset(7)
        }
    }
}
