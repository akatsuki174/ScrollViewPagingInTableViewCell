//
//  ViewModel.swift
//  ScrollViewPagingInTableViewCell
//
//  Created by Akatsuki on 2020/05/16.
//  Copyright © 2020 akatsuki. All rights reserved.
//

import Foundation

class ViewModel {
    
    func numberOfRowsInSection(section: Int) -> Int {
        if (section == 0) { return 5 }
        return 0
    }
    
}
