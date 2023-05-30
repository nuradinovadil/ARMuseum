//
//  TicketSelectViewController.swift
//  ARs
//
//  Created by Nuradinov Adil on 01/05/23.
//

import UIKit

class TicketSelectViewController: UIViewController {
    
    private let wholeView = UIView()
    
    let first = VisitorSelectViewController()
    public var myArray: [Int] = []
    var overallPrice = 0
    
    private lazy var museumSelectButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage(systemName: "building.columns.fill")?.withTintColor(UIColor(red: 116/255, green: 0/255, blue: 40/255, alpha: 1), renderingMode: .alwaysOriginal), for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = .init(red: 116/255, green: 0/255, blue: 40/255, alpha: 1)
        button.setTitle("Select a museum", for: .normal)
        button.setTitleColor(.systemGray2, for: .normal)
        button.addTarget(self, action: #selector(selectMuseum), for: .touchUpInside)
        return button
    }()
    
    @objc func selectMuseum() {
        let controller = MuseumSelectViewController()
        present(controller, animated: true)
    }
    
    private lazy var dateSelectButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage(systemName: "calendar")?.withTintColor(UIColor(red: 116/255, green: 0/255, blue: 40/255, alpha: 1), renderingMode: .alwaysOriginal), for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = .init(red: 116/255, green: 0/255, blue: 40/255, alpha: 1)
        button.setTitle("\(datePicker)", for: .normal)
        return button
    }()
    
    private lazy var datePicker: UIDatePicker = {
       let datePicker = UIDatePicker()
        datePicker.locale = .current
        datePicker.datePickerMode = .date
        datePicker.tintColor = .init(red: 116/255, green: 0/255, blue: 40/255, alpha: 1)
        return datePicker
    }()
    
    
    private lazy var visitorSelectButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage(systemName: "person.2.fill")?.withTintColor(UIColor(red: 116/255, green: 0/255, blue: 40/255, alpha: 1), renderingMode: .alwaysOriginal), for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = .init(red: 116/255, green: 0/255, blue: 40/255, alpha: 1)
        button.setTitle("Visitor", for: .normal)
        button.setTitleColor(.systemGray2, for: .normal)
        button.addTarget(self, action: #selector(selectQuantityOfVisitors), for: .touchUpInside)
        return button
    }()
    
    @objc func selectQuantityOfVisitors() {
        let controller = VisitorSelectViewController()
        if let sheet = controller.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        present(controller, animated: true)
    }
    
    private lazy var proceedButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .init(red: 116/255, green: 0/255, blue: 40/255, alpha: 1)
        button.setTitle("Proceed with Payment", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 17
        return button
    }()
    
    private lazy var summaryLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Summary"
        return label
    }()
    
    private lazy var adultsLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 21)
        label.text = "Adults"
        return label
    }()
    
    private lazy var childrenLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 21)
        label.text = "Children"
        return label
    }()
    
    private lazy var adultsQunatityLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 21)
        label.text = "\(first.visitorArray[0])x"
        return label
    }()
    
    private lazy var childrenQunatityLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 21)
        label.text = "\(first.visitorArray[1])x"
        return label
    }()
    
    private lazy var overallLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Overall"
        return label
    }()
    
    private lazy var overallPriceLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "\(overallPrice)$"
        return label
    }()
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .init(red: 244/255, green: 244/255, blue: 249/255, alpha: 1)
        
        title = "Select a ticket"
        setupViews()
        setupConstraints()
        
//        if first.submitBool == true {
//            refreshLabels()
//            viewDidLoad()
//            print(myArray)
//        }
//
//        let calendar = Calendar.current
//        let dateNow = Date()
//        let dateComponents = calendar.dateComponents([.weekday], from: dateNow)
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "EEEE"
//        let weekday = dateFormatter.string(from: dateNow)
//        print(weekday)
    }
    
    @objc func refreshLabels() {
        DispatchQueue.main.async {
            self.adultsQunatityLabel.text = "\(self.first.visitorArray[0])x"
            self.childrenQunatityLabel.text = "\(self.first.visitorArray[1])x"
        }
    }
}

private extension TicketSelectViewController {
    func setupViews() {
        view.addSubview(wholeView)
        wholeView.addSubview(museumSelectButton)
        wholeView.addSubview(dateSelectButton)
        wholeView.addSubview(visitorSelectButton)
        wholeView.addSubview(proceedButton)
        dateSelectButton.addSubview(datePicker)
        wholeView.addSubview(summaryLabel)
        wholeView.addSubview(adultsLabel)
        wholeView.addSubview(childrenLabel)
//        if first.submitBool == true {
            wholeView.addSubview(adultsQunatityLabel)
            wholeView.addSubview(childrenQunatityLabel)
        wholeView.addSubview(overallLabel)
        wholeView.addSubview(overallPriceLabel)
            
            childrenQunatityLabel.snp.makeConstraints { make in
                make.centerY.equalTo(childrenLabel.snp.centerY)
                make.trailing.equalToSuperview().inset(120)
            }
            adultsQunatityLabel.snp.makeConstraints { make in
                make.centerY.equalTo(adultsLabel.snp.centerY)
                make.trailing.equalToSuperview().inset(120)
            }
//        }
    }
    
    func setupConstraints() {
        wholeView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        museumSelectButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.1)
        }
        museumSelectButton.imageView?.snp.makeConstraints({ make in
            make.centerY.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.04)
            make.width.equalTo(view).multipliedBy(0.07)
            make.leading.equalToSuperview().offset(20)
        })
        museumSelectButton.titleLabel?.snp.makeConstraints({ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(70)
        })
        dateSelectButton.snp.makeConstraints { make in
            make.top.equalTo(museumSelectButton.snp.bottom).offset(15)
            make.leading.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.1)
            make.width.equalTo(view).multipliedBy(0.44)
        }
        dateSelectButton.imageView?.snp.makeConstraints ({ make in
            make.centerY.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.04)
            make.width.equalTo(view).multipliedBy(0.07)
            make.leading.equalToSuperview().offset(20)
        })
        visitorSelectButton.snp.makeConstraints { make in
            make.top.equalTo(museumSelectButton.snp.bottom).offset(15)
            make.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.1)
            make.width.equalTo(view).multipliedBy(0.44)
        }
        visitorSelectButton.imageView?.snp.makeConstraints ({ make in
            make.centerY.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.04)
            make.width.equalTo(view).multipliedBy(0.07)
            make.leading.equalToSuperview().offset(20)
        })
        visitorSelectButton.titleLabel?.snp.makeConstraints ({ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(70)
        })
        proceedButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-25)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.07)
        }
        datePicker.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        summaryLabel.snp.makeConstraints { make in
            make.top.equalTo(visitorSelectButton.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
        }
        adultsLabel.snp.makeConstraints { make in
            make.top.equalTo(summaryLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview()
        }
        childrenLabel.snp.makeConstraints { make in
            make.top.equalTo(adultsLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview()
        }
        overallLabel.snp.makeConstraints { make in
            make.top.equalTo(childrenLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview()
        }
        overallPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(childrenLabel.snp.bottom).offset(15)
            make.trailing.equalToSuperview().inset(30)
        }
    }
}
