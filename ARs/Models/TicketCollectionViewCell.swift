//
//  TicketCollectionViewCell.swift
//  ARs
//
//  Created by Nuradinov Adil on 09/05/23.
//

import UIKit

class TicketCollectionViewCell: UICollectionViewCell {
    
    private let wholeView = UIView()
    private let topView = UIView()
    
    private lazy var dateLabel: UILabel = {
       let label = UILabel()
        label.text = "31 MAY 2023"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    

    private lazy var timeFromLabel: UILabel = {
       let label = UILabel()
        label.text = "10:00 AM"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    private lazy var timerImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "timer")
        imageView.tintColor = .black
        return imageView
    }()
    
    private lazy var timeToLabel: UILabel = {
       let label = UILabel()
        label.text = "12:00 PM"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private lazy var museumLabel: UILabel = {
       let label = UILabel()
        label.text = "31 MAY 2023"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var qrImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "qr")
        return imageView
    }()
    
    private lazy var detailsButton: UIButton = {
        let button = UIButton()
        button.setTitle("TICKET DETAILS", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = .init(red: 116/255, green: 0, blue: 40/255, alpha: 1)
        return button
    }()
    
    func configureCell(with museum:String, date: String, timeFrom: String, timeTo: String) {
        museumLabel.text = "\(museum)"
        dateLabel.text = "\(date)"
        timeFromLabel.text = "\(timeFrom)"
        timeToLabel.text = "\(timeTo)"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        topView.backgroundColor = .systemGray4
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TicketCollectionViewCell {
    func setupViews() {
        contentView.addSubview(wholeView)
        contentView.addSubview(topView)
        contentView.addSubview(qrImage)
        contentView.addSubview(detailsButton)
        topView.addSubview(dateLabel)
        topView.addSubview(timeFromLabel)
        topView.addSubview(timeToLabel)
        topView.addSubview(timerImage)
        topView.addSubview(museumLabel)
    }
    func setupConstraints() {
        wholeView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(15)
        }
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(contentView).multipliedBy(0.3)
        }
        qrImage.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(contentView).multipliedBy(0.5)
            make.height.equalTo(contentView).multipliedBy(0.35)
        }
        detailsButton.snp.makeConstraints { make in
            make.top.equalTo(qrImage.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(25)
            make.width.equalTo(contentView).multipliedBy(0.5)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(15)
        }
        timeFromLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(15)
        }
        timeToLabel.snp.makeConstraints { make in
            make.centerY.equalTo(timeFromLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(15)
        }
        timerImage.snp.makeConstraints { make in
            make.centerY.equalTo(timeFromLabel.snp.centerY)
            make.centerX.equalToSuperview()
        }
        museumLabel.snp.makeConstraints { make in
            make.top.equalTo(timeFromLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(15)
        }
    }
}
