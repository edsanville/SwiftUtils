//
//  SearchIndex.swift
//  starmap3d
//
//  Created by Edward Sanville on 4/1/21.
//

import Foundation

private extension String {

    func processed() -> String {
        return folding(options: [.diacriticInsensitive, .widthInsensitive, .caseInsensitive], locale: nil)
    }

}

struct SearchIndex {

    class Node {
        var items = Set<AnyHashable>()
        var subnodes: [String: Node] = [:]

        var allItems: Set<AnyHashable> {
            var _items = items

            subnodes.values.forEach {
                _items.formUnion($0.allItems)
            }

            return _items
        }
    }

    var root = Node()

    func add(item: AnyHashable, forKey key: String) {
        let key = key.processed()
        var node = root

        for characterIndex in 0..<key.count {
            let character = key[characterIndex]

            if let nextNode = node.subnodes[character] {
                node = nextNode
                continue
            }
            else {
                let nextNode = Node()
                node.subnodes[character] = nextNode
                node = node.subnodes[character]!
            }
        }

        node.items.formUnion([item])
    }

    func getItems(withPrefix prefix: String) -> Set<AnyHashable> {
        let prefix = prefix.processed()
        var node = root

        for characterIndex in 0..<prefix.count {
            let character = prefix[characterIndex]

            if let nextNode = node.subnodes[character] {
                node = nextNode
                continue
            }
            else {
                return []
            }
        }

        return node.allItems
    }

}
