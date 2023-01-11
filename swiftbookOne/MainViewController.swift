//
//  MainViewController.swift
//  swiftbookOne
//
//  Created by Айдар Оспанов on 12.01.2023.
//

import UIKit

class MainViewController: UIViewController {

    let mainLabel = UILabel()
    let resultLabel = UILabel()
    let actionButton = UIButton()
    
    let baseView = BaseView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        
        view.addSubview(mainLabel)
        view.addSubview(resultLabel)
        view.addSubview(baseView)
        view.addSubview(actionButton)
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            mainLabel.heightAnchor.constraint(equalToConstant: 50),
            
            baseView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 50),
            baseView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            baseView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            baseView.heightAnchor.constraint(equalToConstant: 100),
            
            resultLabel.topAnchor.constraint(equalTo: baseView.bottomAnchor, constant: 40),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90),
            resultLabel.heightAnchor.constraint(equalToConstant: 80),
            
            actionButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 50),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150),
            actionButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        mainLabel.text = "Weekday Finder"
        mainLabel.numberOfLines = 0
        mainLabel.textAlignment = .center
        mainLabel.font = UIFont.italicSystemFont(ofSize: 25)
        mainLabel.font = UIFont.init(name: "Noteworthy", size: 32)
        
        resultLabel.text = "Here you will see the day of the week"
        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 0
        resultLabel.font = UIFont.init(name: "Snell Roundhand", size: 25)
        
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.backgroundColor = .black
        actionButton.layer.cornerRadius = 10
        actionButton.setTitle("Find Day", for: .normal)
        actionButton.addTarget(self, action: #selector(findDay(sender:)), for: .touchUpInside)
    }
    
    
    @objc func findDay(sender: UIButton) {
        guard let day = baseView.dateTF.text, let month = baseView.monthTF.text,
                let year = baseView.yearTF.text else { return }
        
        let calendar = Calendar.current
        var dateComponent = DateComponents()
        dateComponent.day = Int(day) ?? 0
        dateComponent.month = Int(month) ?? 0
        dateComponent.year = Int(year) ?? 0
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponent) else { return }
        
        let weekday = dateFormatter.string(from: date)
        resultLabel.text = weekday.capitalized
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
