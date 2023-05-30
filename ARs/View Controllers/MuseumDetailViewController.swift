//
//  MuseumDetailViewController.swift
//  ARs
//
//  Created by Nuradinov Adil on 26/04/23.
//

import UIKit

class MuseumDetailViewController: UIViewController {
    
    private let wholeView = UIView()
    private let scrollView = UIScrollView()
    
    private let days = Constants.Values.daysOfWork
    private let time = Constants.Values.workingTime
    
    let museImage = Constants.Values.museImages
    
    private lazy var museumImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "music festival")
        imageView.contentMode = .scaleToFill
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        return imageView
    }()
    
    func setImage(with image: String) {
        museumImage.image = UIImage(named: "\(image)")
    }
    
    private lazy var purchaseButton: UIButton = {
       let button = UIButton()
        button.setTitle("Buy ticket", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.cornerRadius = 15
        button.backgroundColor = .init(red: 116/255, green: 0/255, blue: 40/255, alpha: 1)
        button.addTarget(self, action: #selector(pushToTicketSelection), for: .touchUpInside)
        return button
    }()
    
    @objc func pushToTicketSelection() {
        let controller = TicketSelectViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private lazy var callToMuseumButton: UIButton = {
       let button = UIButton()
        button.setTitle("Make a call", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.cornerRadius = 15
        button.backgroundColor = .systemGray
        return button
    }()
    
    private lazy var descriptionNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Description"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
       let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var workingHoursTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(WorkingHoursTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.workingHoursTableViewCell)
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 25
        tableView.allowsSelection = false
        tableView.isScrollEnabled = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .init(red: 244/255, green: 244/255, blue: 249/255, alpha: 1)
        
        title = "Info about museum"
        
        setupViews()
        setupConstraints()
        
        workingHoursTableView.dataSource = self
        workingHoursTableView.delegate = self
        setImage(with: museImage[0])
    }
}

extension MuseumDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.workingHoursTableViewCell, for: indexPath) as! WorkingHoursTableViewCell
        cell.setWorkingDayAndTime(with: days[indexPath.row], and: time[indexPath.row])
        return cell
    }
}

extension MuseumDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = view.frame.size.height * 0.05
        return CGFloat(height)
    }
}

private extension MuseumDetailViewController {
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(wholeView)
        wholeView.addSubview(museumImage)
        view.addSubview(purchaseButton)
        view.addSubview(callToMuseumButton)
        wholeView.addSubview(descriptionNameLabel)
        wholeView.addSubview(descriptionLabel)
        wholeView.addSubview(workingHoursTableView)
    }
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.width.equalTo(view.snp.width)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        wholeView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.leading.trailing.equalTo(view).inset(15)
            make.bottom.equalTo(scrollView.snp.bottom)
            make.height.equalTo(view).multipliedBy(2)
        }
        museumImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.3)
        }
        purchaseButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(10)
            make.trailing.equalToSuperview().inset(25)
            make.width.equalTo(view).multipliedBy(0.42)
            make.height.equalTo(view).multipliedBy(0.05)
        }
        callToMuseumButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(10)
            make.leading.equalToSuperview().offset(25)
            make.width.equalTo(view).multipliedBy(0.42)
            make.height.equalTo(view).multipliedBy(0.05)
        }
        descriptionNameLabel.snp.makeConstraints { make in
            make.top.equalTo(museumImage.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionNameLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
        }
        workingHoursTableView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.35)
        }
    }
}
