//
//  ARViewController.swift
//  ARs
//
//  Created by Nuradinov Adil on 19/04/23.
//

import UIKit
import VisionKit

class ARViewController: UIViewController {
    
    let arts = Constants.arts
    
    var scannerAvailable: Bool {
        DataScannerViewController.isSupported && DataScannerViewController.isAvailable
    }
    
    private lazy var proceedButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .init(red: 116/255, green: 0/255, blue: 40/255, alpha: 1)
        button.setTitle("Tap to Scan QR", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 17
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonPressed(_ sender: Any) {
        guard scannerAvailable == true else {
            print("Error. Scanner is not available.")
            return
        }
        let dataScanner = DataScannerViewController(recognizedDataTypes: [.barcode()], isHighlightingEnabled: true)
        present(dataScanner, animated: true) {
            try? dataScanner.startScanning()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        
        view.backgroundColor = .init(red: 244/255, green: 244/255, blue: 249/255, alpha: 1)
    }
}

extension ARViewController: DataScannerViewControllerDelegate {
    func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
        for item in addedItems {
            switch item {
            case .barcode(let code):
                guard let text = code.payloadStringValue else { return }
                for i in arts {
                    let vc = ArtDetailViewController()
                    if i == text {
                        vc.setImageAndDesc(with: text)
                        present(vc, animated: true)
                        print(text)
                    }
                }
            default:
                print("Unexpected item")
            }
        }
    }
}

private extension ARViewController {
    func setupViews() {
        view.addSubview(proceedButton)
    }
    func setupConstraints() {
        proceedButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(view).multipliedBy(0.1)
        }
    }
}
