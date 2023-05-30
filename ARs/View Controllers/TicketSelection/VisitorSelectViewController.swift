//
//  VisitorSelectViewController.swift
//  ARs
//
//  Created by Nuradinov Adil on 01/05/23.
//

import UIKit

class VisitorSelectViewController: UIViewController {

    private let wholeView = UIView()
    
    private var numberOfAdults: Int = 1
    private var numberOfChildren: Int = 1
    public var submitBool: Bool = false
    var visitorArray: [Int] = [1, 1]
    
    
    private lazy var selectLabel: UILabel = {
       let label = UILabel()
        label.text = "Visitors"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()
    
    private lazy var adultsLabel: UILabel = {
       let label = UILabel()
        label.text = "Adults"
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    private lazy var adultsQuantityLabel: UILabel = {
       let label = UILabel()
        label.text = "\(numberOfAdults)"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var increaseAdultsButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "plus.circle.fill")?.withTintColor(UIColor(red: 116/255, green: 0/255, blue: 40/255, alpha: 1), renderingMode: .alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(increaseAdults), for: .touchUpInside)
        return button
    }()
    
    @objc func increaseAdults() {
        numberOfAdults += 1
        adultsQuantityLabel.text = "\(numberOfAdults)"
    }
    
    private lazy var decreaseAdultsButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "minus.circle.fill")?.withTintColor(UIColor(red: 116/255, green: 0/255, blue: 40/255, alpha: 1), renderingMode: .alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(decreaseAdults), for: .touchUpInside)
        return button
    }()
    
    @objc func decreaseAdults() {
        if numberOfAdults > 0 {
            numberOfAdults -= 1
        }
        adultsQuantityLabel.text = "\(numberOfAdults)"
    }
    
    private lazy var childrenLabel: UILabel = {
       let label = UILabel()
        label.text = "Children"
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    private lazy var childrenQuantityLabel: UILabel = {
       let label = UILabel()
        label.text = "\(numberOfChildren)"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var increaseChildrenButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "plus.circle.fill")?.withTintColor(UIColor(red: 116/255, green: 0/255, blue: 40/255, alpha: 1), renderingMode: .alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(increaseChildren), for: .touchUpInside)
        return button
    }()
    
    @objc func increaseChildren() {
        numberOfChildren += 1
        childrenQuantityLabel.text = "\(numberOfChildren)"
    }
    
    private lazy var decreaseChildrenButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "minus.circle.fill")?.withTintColor(UIColor(red: 116/255, green: 0/255, blue: 40/255, alpha: 1), renderingMode: .alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(decreaseChildren), for: .touchUpInside)
        return button
    }()
    
    @objc func decreaseChildren() {
        if numberOfChildren > 0 {
            numberOfChildren -= 1
        }
        childrenQuantityLabel.text = "\(numberOfChildren)"
    }
    
    private lazy var childrenDescLabel: UILabel = {
       let label = UILabel()
        label.text = "Children from 10 to 16 years"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var submitButton: UIButton = {
       let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        button.layer.cornerRadius = 17
        button.backgroundColor = .init(red: 116/255, green: 0/255, blue: 40/255, alpha: 1)
        button.addTarget(self, action: #selector(submitAction), for: .touchUpInside)
        return button
    }()
    
    @objc func submitAction() {
        submitBool = true
        visitorArray.removeAll()
        visitorArray.append(numberOfAdults)
        visitorArray.append(numberOfChildren)
        print(submitBool)
        print(visitorArray)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }

}

private extension VisitorSelectViewController {
    func setupViews() {
        view.addSubview(wholeView)
        wholeView.addSubview(selectLabel)
        wholeView.addSubview(adultsLabel)
        wholeView.addSubview(adultsQuantityLabel)
        wholeView.addSubview(increaseAdultsButton)
        wholeView.addSubview(decreaseAdultsButton)
        wholeView.addSubview(childrenLabel)
        wholeView.addSubview(childrenQuantityLabel)
        wholeView.addSubview(increaseChildrenButton)
        wholeView.addSubview(decreaseChildrenButton)
        wholeView.addSubview(childrenDescLabel)
        wholeView.addSubview(submitButton)
    }
    func setupConstraints() {
        wholeView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview()
        }
        selectLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        adultsLabel.snp.makeConstraints { make in
            make.top.equalTo(selectLabel.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(15)
        }
        adultsQuantityLabel.snp.makeConstraints { make in
            make.top.equalTo(selectLabel.snp.bottom).offset(25)
            make.trailing.equalToSuperview().inset(85)
        }
        increaseAdultsButton.snp.makeConstraints { make in
            make.centerY.equalTo(adultsQuantityLabel)
            make.leading.equalTo(adultsQuantityLabel.snp.trailing).offset(30)
            make.height.width.equalTo(view).multipliedBy(0.07)
        }
        increaseAdultsButton.imageView?.snp.makeConstraints ({ make in
            make.edges.equalToSuperview()
        })
        decreaseAdultsButton.snp.makeConstraints { make in
            make.centerY.equalTo(adultsQuantityLabel)
            make.trailing.equalTo(adultsQuantityLabel.snp.trailing).inset(35)
            make.height.width.equalTo(view).multipliedBy(0.07)
        }
        decreaseAdultsButton.imageView?.snp.makeConstraints ({ make in
            make.edges.equalToSuperview()
        })
        childrenLabel.snp.makeConstraints { make in
            make.top.equalTo(adultsLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(15)
        }
        childrenQuantityLabel.snp.makeConstraints { make in
            make.top.equalTo(adultsLabel.snp.bottom).offset(20)
            make.trailing.equalToSuperview().inset(85)
        }
        increaseChildrenButton.snp.makeConstraints { make in
            make.centerY.equalTo(childrenQuantityLabel)
            make.leading.equalTo(childrenQuantityLabel.snp.trailing).offset(30)
            make.height.width.equalTo(view).multipliedBy(0.07)
        }
        increaseChildrenButton.imageView?.snp.makeConstraints ({ make in
            make.edges.equalToSuperview()
        })
        decreaseChildrenButton.snp.makeConstraints { make in
            make.centerY.equalTo(childrenQuantityLabel)
            make.trailing.equalTo(childrenQuantityLabel.snp.trailing).inset(35)
            make.height.width.equalTo(view).multipliedBy(0.07)
        }
        decreaseChildrenButton.imageView?.snp.makeConstraints ({ make in
            make.edges.equalToSuperview()
        })
        childrenDescLabel.snp.makeConstraints { make in
            make.top.equalTo(childrenLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(view).multipliedBy(0.35)
        }
        submitButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-15)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.13)
        }
    }
}

