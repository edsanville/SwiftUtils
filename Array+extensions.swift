//
//  Array+extensions.swift
//  StarMap3DPlus
//
//  Created by Edward Sanville on 11/5/19.
//

import Foundation

extension Array {
    public subscript(safeIndex index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }

        return self[index]
    }

    mutating func append(optional item: Element?) {
        if let item = item {
            self.append(item)
        }
    }

    mutating func append<S>(contentsOfOptional newElements: S?) where Element == S.Element, S : Sequence {
        if let sequence = newElements {
            sequence.forEach { item in
                self.append(item)
            }
        }
    }
}
