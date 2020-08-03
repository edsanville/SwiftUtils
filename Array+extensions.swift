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
}
