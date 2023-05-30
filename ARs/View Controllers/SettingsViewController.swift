//
//  SettingsViewController.swift
//  ARs
//
//  Created by Nuradinov Adil on 14/04/23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let wholeView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .init(red: 244/255, green: 244/255, blue: 249/255, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Settings"

        setupViews()
        setupConstraints()
    }
    
}

private extension SettingsViewController {
    func setupViews() {
        view.addSubview(wholeView)
    }
    
    func setupConstraints() {
        wholeView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

