//
//  TypeOfEventCollectionViewCell.swift
//  ARs
//
//  Created by Nuradinov Adil on 17/04/23.
//

import UIKit

class TypeOfEventCollectionViewCell: UICollectionViewCell {
    
    private lazy var nameOfType: UILabel = {
        let label = UILabel()
        label.text = "Music"
        label.textAlignment = .center
        label.textColor = .init(red: 116/255, green: 0, blue: 40/255, alpha: 1)
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
    
    func setupNameOfEvent(with name: String) {
        nameOfType.text = "\(name)"
    }
}

private extension TypeOfEventCollectionViewCell {
    func setupViews() {
        contentView.addSubview(nameOfType)
    }
    
    func setupConstraints() {
        nameOfType.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
