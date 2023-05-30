//
//  EventsTableViewCell.swift
//  ARs
//
//  Created by Nuradinov Adil on 17/04/23.
//

import UIKit

class EventsTableViewCell: UITableViewCell {
    
    private lazy var wholeView = UIView()
    
    private let museImages = Constants.Values.museImages
    private let days = Constants.Values.days
    private let prices = Constants.Values.prices
    private let images = Constants.images
    
    
    private lazy var imageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ImageOfEventCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.imageOfEventCollectionViewCell)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var nameOfPlaceLabel: UILabel = {
       let label = UILabel()
        label.text = "Fondazione Museo Storico del Trentino"
        label.textColor = .init(red: 116/255, green: 0, blue: 40/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    func setName(with name: String) {
        nameOfPlaceLabel.text = "\(name)"
    }
    
    private lazy var addressOfMuseumLabel: UILabel = {
       let label = UILabel()
        label.text = "Local history museum"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var daysLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Prices by days"
        return label
    }()
    
    private lazy var priceCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PriceCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.priceCollectionViewCell)
        return collectionView
    }()
    
//    func setNameAndAddress(name: String, address: String) {
//        APIManager.shared.getPost(collection: "Trento", docName: "Muse", completion: { doc in
//            guard doc != nil else { return }
//            self.nameOfPlaceLabel.text = doc?.name
//            self.addressOfMuseumLabel.text = doc?.name
//        })
//    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
        priceCollectionView.dataSource = self
        priceCollectionView.delegate = self
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EventsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == imageCollectionView {
            return museImages.count
        }
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == imageCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.imageOfEventCollectionViewCell, for: indexPath) as! ImageOfEventCollectionViewCell
            cell.setMuseumImage(with: museImages[indexPath.row])
            cell.layer.cornerRadius = 15
            cell.clipsToBounds = true
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.priceCollectionViewCell, for: indexPath) as! PriceCollectionViewCell
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
        cell.layer.borderWidth = 1
        cell.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        cell.setDays(with: days[indexPath.row])
        cell.setPrice(with: prices[indexPath.row])
        cell.setBackgroundColor(for: prices[indexPath.row])
        return cell
    }
}

extension EventsTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == imageCollectionView {
            let height = contentView.frame.size.height * 0.5
            return CGSize(width: height, height: height)
        }
        let height = contentView.frame.size.height * 0.17
        let width = contentView.frame.size.width * 0.1
        return CGSize(width: width, height: height)
    }
}

private extension EventsTableViewCell {
    func setupViews() {
        contentView.addSubview(wholeView)
        wholeView.addSubview(imageCollectionView)
        wholeView.addSubview(nameOfPlaceLabel)
        wholeView.addSubview(addressOfMuseumLabel)
        wholeView.addSubview(daysLabel)
        wholeView.addSubview(priceCollectionView)
    }
    
    func setupConstraints() {
        wholeView.snp.makeConstraints { make in
            make.top.leading.bottom.equalTo(contentView).inset(15)
            make.trailing.equalToSuperview()
        }
        imageCollectionView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(contentView).multipliedBy(0.5)
        }
        nameOfPlaceLabel.snp.makeConstraints { make in
            make.top.equalTo(imageCollectionView.snp.bottom).offset(7)
            make.leading.trailing.equalToSuperview()
        }
        addressOfMuseumLabel.snp.makeConstraints { make in
            make.top.equalTo(nameOfPlaceLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
        }
        daysLabel.snp.makeConstraints { make in
            make.top.equalTo(addressOfMuseumLabel.snp.bottom).offset(7)
            make.leading.trailing.equalToSuperview()
        }
        priceCollectionView.snp.makeConstraints { make in
            make.top.equalTo(daysLabel.snp.bottom).offset(7)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(contentView).multipliedBy(0.17)
        }
    }
}
