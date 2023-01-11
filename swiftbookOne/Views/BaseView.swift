//
//  BaseView.swift
//  swiftbookOne
//
//  Created by Айдар Оспанов on 12.01.2023.
//

import UIKit

class BaseView: UIView {
    
    private let dates = ["Date", "Month", "Year"]
    
    let dateTF: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textAlignment = .left
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let monthTF: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textAlignment = .left
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let yearTF: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textAlignment = .left
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let stackViewForLabel: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        //stack.alignment = .leading
        stack.spacing = 10
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let stackViewForTF: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        //stack.alignment = .trailing
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackViewForLabel)
        dates.forEach {
            stackViewForLabel.addArrangedSubview(makeLabel(with: $0))
        }
        
        addSubview(stackViewForTF)
        [
            dateTF,
            monthTF,
            yearTF,
        ].forEach {
            addSubview($0)
            stackViewForTF.addArrangedSubview($0)
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackViewForLabel.topAnchor.constraint(equalTo: topAnchor),
            stackViewForLabel.leadingAnchor.constraint(equalTo: leadingAnchor),

            stackViewForTF.topAnchor.constraint(equalTo: topAnchor),
            stackViewForTF.leadingAnchor.constraint(equalTo: stackViewForLabel.leadingAnchor, constant: 60),
            stackViewForTF.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
