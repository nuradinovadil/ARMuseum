//
//  MuseumSelectViewController.swift
//  ARs
//
//  Created by Nuradinov Adil on 01/05/23.
//

import UIKit

class MuseumSelectViewController: UIViewController {
    
    private let wholeView = UIView()
    
    private lazy var selectLabel: UILabel = {
       let label = UILabel()
        label.text = "Select a museum"
        label.font = UIFont.boldSystemFont(ofSize: 21)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }
}

private extension MuseumSelectViewController {
    func setupViews() {
        view.addSubview(wholeView)
        wholeView.addSubview(selectLabel)
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
    }
}
