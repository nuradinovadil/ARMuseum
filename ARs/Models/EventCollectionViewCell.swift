//
//  EventCollectionViewCell.swift
//  ARs
//
//  Created by Nuradinov Adil on 14/04/23.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    
    private lazy var wholeView = UIView()
    
    private lazy var eventImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "music festival")
        imageView.layer.cornerRadius = 17
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    
    private lazy var eventNameLabel: UILabel = {
       let label = UILabel()
        label.text = "National Music Festival"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    private lazy var eventDateLabel: UILabel = {
       let label = UILabel()
        label.text = "Mon - Fri, 10.00AM - 18.00PM"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .init(red: 116/255, green: 0, blue: 40/255, alpha: 1)
        return label
    }()
    
    private lazy var locationImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "mappin.circle.fill")
        imageView.tintColor = .init(red: 116/255, green: 0, blue: 40/255, alpha: 1)
        return imageView
    }()
    
    private lazy var locationNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Grand Park, New York"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .systemGray2
        return label
    }()
    
    private lazy var favoritesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart")
        imageView.tintColor = .init(red: 116/255, green: 0, blue: 40/255, alpha: 1)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension EventCollectionViewCell {
    func setupViews() {
        contentView.addSubview(wholeView)
        wholeView.addSubview(eventImageView)
        wholeView.addSubview(eventNameLabel)
        wholeView.addSubview(eventDateLabel)
        wholeView.addSubview(locationImageView)
        wholeView.addSubview(locationNameLabel)
        wholeView.addSubview(favoritesImageView)
    }
    
    func setupConstraints() {
        wholeView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(15)
        }
        eventImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(contentView).multipliedBy(0.65)
        }
        eventNameLabel.snp.makeConstraints { make in
            make.top.equalTo(eventImageView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
        }
        eventDateLabel.snp.makeConstraints { make in
            make.top.equalTo(eventNameLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
        }
        locationImageView.snp.makeConstraints { make in
            make.top.equalTo(eventDateLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
        }
        locationNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(locationImageView.snp.trailing).offset(10)
            make.bottom.equalTo(locationImageView.snp.bottom)
        }
        favoritesImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
            make.width.equalToSuperview().multipliedBy(0.15)
        }
        
    }
}
