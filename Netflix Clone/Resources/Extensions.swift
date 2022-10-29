//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Tunay Toksöz on 29.10.2022.
//

import Foundation


extension String {
    func capitalizeFirstLetter() -> String {
        return prefix(1).self.uppercased() + self.lowercased().dropFirst()
    }
}
