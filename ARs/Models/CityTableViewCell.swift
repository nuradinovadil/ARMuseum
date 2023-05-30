//
//  CityTableViewCell.swift
//  ARs
//
//  Created by Nuradinov Adil on 02/05/23.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    private lazy var cityLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Trento"
        label.textColor = .black
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNameToCity(with name: String) {
        cityLabel.text = "\(name)"
    }
    
}

private extension CityTableViewCell {
    func setupViews() {
        contentView.addSubview(cityLabel)
    }
    
    func setupConstraints() {
        cityLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
        }
    }
}
