//
//  BaseView + ext.swift
//  swiftbookOne
//
//  Created by Айдар Оспанов on 12.01.2023.
//

import UIKit

extension BaseView {
    
    func makeLabel(with date: String) -> UILabel {
        let label = UILabel()
        label.text = date
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }
    
}
