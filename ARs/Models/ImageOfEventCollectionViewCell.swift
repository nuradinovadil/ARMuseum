//
//  ImageOfEventCollectionViewCell.swift
//  ARs
//
//  Created by Nuradinov Adil on 17/04/23.
//

import UIKit
import SnapKit

class ImageOfEventCollectionViewCell: UICollectionViewCell {
    
    private lazy var eventImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "music festival")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setMuseumImage(with image: String) {
        eventImage.image = UIImage(named: "\(image)")
    }
}

private extension ImageOfEventCollectionViewCell {
    func setupViews() {
        contentView.addSubview(eventImage)
    }
    func setupConstraints() {
        eventImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
