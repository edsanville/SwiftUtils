//
//  OrderedSet.swift
//  starmap3d
//
//  Created by Edward Sanville on 12/17/23.
//

import Foundation

struct OrderedSet<T: Hashable>: Sequence {
    var set = Set<T>()
    var array: [T] = []

    init() {
        
    }

    init<Seq>(_ sequence: Seq) where Seq: Sequence, Seq.Element == T  {
        for item in sequence {
            if !self.set.contains(item) {
                self.set.insert(item)
                self.array.append(item)
            }
        }
    }

    struct Iterator: IteratorProtocol {
        let orderedSet: OrderedSet<T>
        var index = 0

        init(_ orderedSet: OrderedSet<T>) {
            self.orderedSet = orderedSet
            self.index = 0
        }

        mutating func next() -> T? {
            if index < orderedSet.array.count {
                defer { index += 1 }
                return orderedSet.array[index]
            }
            else {
                return nil
            }
        }
    }

    func makeIterator() -> Iterator {
        return Iterator(self)
    }

    mutating func removeAll() {
        set.removeAll()
        array.removeAll()
    }

    static func += (left: inout OrderedSet<T>, right: any Sequence<T>) {
        let itemsToAdd = right.filter({ object in
            return !left.set.contains(object)
        })

        left.set = left.set.union(itemsToAdd)
        left.array += itemsToAdd
    }

    subscript(_ index: Int) -> T {
        return array[index]
    }

    var count: Int {
        return array.count
    }

}
