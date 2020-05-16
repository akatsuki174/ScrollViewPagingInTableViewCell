//
//  PageScrollCell.swift
//  ScrollViewPagingInTableViewCell
//
//  Created by Akatsuki on 2020/05/16.
//  Copyright © 2020 akatsuki. All rights reserved.
//

import UIKit

class PageScrollCell: UITableViewCell {
    
    static var cellName: String = "PageScrollCell"
    @IBOutlet weak var containerView: UIView!
    private let scrollView = UIScrollView()
    private let contentWidth = UIScreen.main.bounds.width
    private lazy var contentHeight: CGFloat = {
        return contentWidth * 0.5
    }()

    static func nib() -> UINib {
        return UINib(nibName: cellName, bundle: nil)
    }
    
    static var reuseIdentifier: String {
        get { return cellName }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false

        scrollView.frame = CGRect(x: 0, y: 0, width: contentWidth, height: contentHeight)
        containerView.addSubview(scrollView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setContent(item: Item) {
        for (index, value) in item.images.enumerated() {
            let imageView = UIImageView(frame: CGRect(x: CGFloat(index) * contentWidth, y: 0, width: contentWidth, height: contentHeight))
            imageView.image = value
            scrollView.addSubview(imageView)
        }
        scrollView.frame = CGRect(x: CGFloat(item.currentIndex) * contentWidth, y: 0, width: contentWidth, height: contentHeight)
        scrollView.contentSize = CGSize(width: contentWidth * CGFloat(item.images.count), height: contentHeight)
    }
    
}
