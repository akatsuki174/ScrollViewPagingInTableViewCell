//
//  ViewController.swift
//  ScrollViewPagingInTableViewCell
//
//  Created by Akatsuki on 2020/05/16.
//  Copyright © 2020 akatsuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(PageScrollCell.nib(), forCellReuseIdentifier: PageScrollCell.reuseIdentifier)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PageScrollCell.reuseIdentifier) as? PageScrollCell else { fatalError() }
        cell.setContent(images: [UIImage(named: "image1")!, UIImage(named: "image2")!, UIImage(named: "image3")!])
        return cell
    }
        
}
