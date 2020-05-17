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
    @IBOutlet weak var titleLabel: UILabel!
    private let scrollView = UIScrollView()
    private let contentWidth = UIScreen.main.bounds.width
    private lazy var contentHeight: CGFloat = {
        return contentWidth * 0.5
    }()
    weak var delegate: PageScrollCellDelegate?

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
        scrollView.delegate = self

        scrollView.frame = CGRect(x: 0, y: 0, width: contentWidth, height: contentHeight)
        containerView.addSubview(scrollView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setItem(item: Item) {
        titleLabel.text = String(item.id)
        for (index, value) in item.images.enumerated() {
            let imageView = UIImageView(frame: CGRect(x: CGFloat(index) * contentWidth, y: 0, width: contentWidth, height: contentHeight))
            imageView.image = value
            scrollView.addSubview(imageView)
        }
        scrollView.contentOffset = CGPoint(x: CGFloat(item.currentPage) * contentWidth, y: 0)
        scrollView.contentSize = CGSize(width: contentWidth * CGFloat(item.images.count), height: contentHeight)
    }
    
}

extension PageScrollCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let pageIndex = round(scrollView.contentOffset.x / contentWidth)
        delegate?.pageScrolled(self, page: Int(pageIndex))
    }
}

protocol PageScrollCellDelegate: AnyObject {
    func pageScrolled(_ cell: PageScrollCell, page: Int)
}
