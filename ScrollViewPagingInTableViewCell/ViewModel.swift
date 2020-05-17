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
        items = [Item(id: 1, images: createImageArray(), currentPage: 0),
                 Item(id: 2, images: createImageArray(), currentPage: 0),
                 Item(id: 3, images: createImageArray(), currentPage: 0),
                 Item(id: 4, images: createImageArray(), currentPage: 0),
                 Item(id: 5, images: createImageArray(), currentPage: 0)]
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if (section == 0) { return items.count }
        return 0
    }
    
    func content(index: Int) -> Item {
        if (index >= items.count) { fatalError("out of index") }
        return items[index]
    }
    
    private func createImageArray() -> [UIImage] {
        return [UIImage(named: "image1")!, UIImage(named: "image2")!, UIImage(named: "image3")!]
    }
    
    func changePage(index: Int, page: Int) {
        if (index >= items.count) { fatalError("out of index") }
        items[index].currentPage = page
    }
}

struct Item {
    let id: Int
    let images: [UIImage]
    var currentPage: Int = 0
}
