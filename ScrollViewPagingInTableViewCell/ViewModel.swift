//
//  ViewModel.swift
//  ScrollViewPagingInTableViewCell
//
//  Created by Akatsuki on 2020/05/16.
//  Copyright © 2020 akatsuki. All rights reserved.
//

import UIKit

class ViewModel {
    
    private var items: [Item] = []
    
    func createItems() {
        items = [Item(id: 1, images: createImageArray(), currentIndex: 0),
                 Item(id: 2, images: createImageArray(), currentIndex: 0),
                 Item(id: 3, images: createImageArray(), currentIndex: 0),
                 Item(id: 4, images: createImageArray(), currentIndex: 0),
                 Item(id: 5, images: createImageArray(), currentIndex: 0)]
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if (section == 0) { return items.count }
        return 0
    }
    
    func content(index: Int) -> Item {
        return items[index]
    }
    
    private func createImageArray() -> [UIImage] {
        return [UIImage(named: "image1")!, UIImage(named: "image2")!, UIImage(named: "image3")!]
    }
    
}

struct Item {
    let id: Int
    let images: [UIImage]
    var currentIndex: Int = 0
}
