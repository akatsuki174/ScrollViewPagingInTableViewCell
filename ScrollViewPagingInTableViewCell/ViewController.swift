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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(PageScrollCell.nib(), forCellReuseIdentifier: PageScrollCell.reuseIdentifier)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PageScrollCell.reuseIdentifier) as? PageScrollCell else { fatalError() }
        let image = UIImage(named: "image")
        guard let img = image else { return UITableViewCell() }
        cell.setContent(images: [img, img, img])
        return cell
    }
        
}
