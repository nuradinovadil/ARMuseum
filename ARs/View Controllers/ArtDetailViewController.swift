//
//  ViewController.swift
//  ARs
//
//  Created by Nuradinov Adil on 14/05/23.
//

import UIKit

class ArtDetailViewController: UIViewController {
    
    let wholeView = UIView()
    let artObjects: [String:String] = Constants.Values.artObjects
    
    private lazy var artImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "music fectival")
        return imageView
    }()
    
    private lazy var artDescLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 21)
        label.numberOfLines = 0
        label.text = "No text found"
        return label
    }()
    
    func setImageAndDesc(with name: String) {
        if let value = artObjects["\(name)"] {
            artImageView.image = UIImage(named: name)
            artDescLabel.text = value
        } else {
            print("Key not found in dictionary")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        setupViews()
        setupConstraints()
    }
    

}

private extension ArtDetailViewController {
    func setupViews() {
        view.addSubview(wholeView)
        wholeView.addSubview(artImageView)
        wholeView.addSubview(artDescLabel)
    }
    func setupConstraints() {
        wholeView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(35)
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        artImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.4)
        }
        artDescLabel.snp.makeConstraints { make in
            make.top.equalTo(artImageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
        }
    }
}
