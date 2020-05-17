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
        viewModel.createItems()
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PageScrollCell.reuseIdentifier, for: indexPath) as? PageScrollCell else { fatalError() }
        cell.setItem(item: viewModel.content(index: indexPath.row))
        cell.delegate = self
        return cell
    }
}

extension ViewController: PageScrollCellDelegate {
    func pageScrolled(_ cell: PageScrollCell, page: Int) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        viewModel.changePage(index: indexPath.row, page: page)
    }
}
