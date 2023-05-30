//
//  TicketViewController.swift
//  ARs
//
//  Created by Nuradinov Adil on 14/04/23.
//

import UIKit

class TicketViewController: UIViewController {
    
    private let wholeView = UIView()
    
    private lazy var ticketCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TicketCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.ticketCollectionViewCell)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var pageControl: UIPageControl = {
       let pageControl = UIPageControl()
        pageControl.addTarget(self, action: #selector(pageControlDidChange), for: .valueChanged)
        return pageControl
    }()
    
    @objc func pageControlDidChange() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .init(red: 244/255, green: 244/255, blue: 249/255, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Tickets"
        
        setupViews()
        setupConstraints()
        
        ticketCollectionView.dataSource = self
        ticketCollectionView.delegate = self
    }
}

extension TicketViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.ticketCollectionViewCell, for: indexPath) as! TicketCollectionViewCell
//        cell.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
//        cell.layer.borderWidth = 1
        cell.backgroundColor = .white
        cell.configureCell(with: Constants.museums[indexPath.row], date: Constants.dates[indexPath.row], timeFrom: Constants.timeFrom[indexPath.row], timeTo: Constants.timeTo[indexPath.row])
        return cell
    }
}

extension TicketViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = view.frame.size.height * 0.5
        let width = view.frame.size.width * 0.75
        return CGSize(width: width, height: height)
    }
}

private extension TicketViewController {
    func setupViews() {
        view.addSubview(wholeView)
        wholeView.addSubview(ticketCollectionView)
    }
    
    func setupConstraints() {
        wholeView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        ticketCollectionView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.5)
            make.leading.trailing.equalToSuperview()
        }
    }
}
