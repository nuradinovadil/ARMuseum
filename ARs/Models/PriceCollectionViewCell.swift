//
//  PriceCollectionViewCell.swift
//  ARs
//
//  Created by Nuradinov Adil on 06/05/23.
//

import UIKit

class PriceCollectionViewCell: UICollectionViewCell {
    
    let min = Constants.Values.minPrice
    let max = Constants.Values.maxPrice
    
    
    private lazy var dayNameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "M"
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = ""
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDays(with day: String) {
        dayNameLabel.text = "\(day)"
    }
    
    func setPrice(with price: Int) {
        priceLabel.text = "\(price)$"
    }
    
    func setBackgroundColor(for price: Int) {
        print("\(min), \(max)")
        switch price {
        case 0:
            self.backgroundColor = .white
        case min:
            self.backgroundColor = .systemGreen
        case max:
            self.backgroundColor = .systemRed
        default:
            self.backgroundColor = .systemYellow
        }
    }
}

private extension PriceCollectionViewCell {
    func setupViews() {
        contentView.addSubview(dayNameLabel)
        contentView.addSubview(priceLabel)
    }
    
    func setupConstraints() {
        dayNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(3)
        }
        priceLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dayNameLabel.snp.bottom).offset(4)
        }
    }
}
