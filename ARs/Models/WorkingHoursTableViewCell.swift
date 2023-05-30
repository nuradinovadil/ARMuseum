//
//  WorkingHoursTableViewCell.swift
//  ARs
//
//  Created by Nuradinov Adil on 01/05/23.
//

import UIKit

class WorkingHoursTableViewCell: UITableViewCell {
    
    private lazy var daysLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Monday"
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .systemGreen
        label.text = "10:00-18:00"
        return label
    }()
    
    func setWorkingDayAndTime(with day: String, and time: String) {
        daysLabel.text = "\(day)"
        if time == "Weekend" {
            timeLabel.textColor = .systemRed
        }
        timeLabel.text = "\(time)"
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension WorkingHoursTableViewCell {
    func setupView() {
        contentView.addSubview(daysLabel)
        contentView.addSubview(timeLabel)
    }
    
    func setupConstraints() {
        daysLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
            make.width.equalTo(contentView).multipliedBy(0.4)
        }
        timeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(daysLabel.snp.trailing).offset(15)
        }
    }
}
