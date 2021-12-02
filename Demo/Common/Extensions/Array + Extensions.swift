//
//  Array + Extensions.swift
//  Demo
//
//  Created by Кирилл on 03.11.2021.
//

import Foundation

extension Array {
    func at(_ index: Int) -> Element? {
        guard index >= 0, index < self.count else { return nil }
        return self[index]
    }
}

extension Array where Element: Hashable {
    func unique() -> Self {
        Array(Set(self))
    }
}
