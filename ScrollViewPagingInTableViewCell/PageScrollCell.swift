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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setContent(images: [UIImage]) {
        let contentWidth = UIScreen.main.bounds.width
        let contentHeight = contentWidth * 0.5
        scrollView.frame = CGRect(x: 0, y: 0, width: contentWidth, height: contentHeight)
        containerView.addSubview(scrollView)
        
        for (index, value) in images.enumerated() {
            let imageView = UIImageView(frame: CGRect(x: CGFloat(index) * contentWidth, y: 0, width: contentWidth, height: contentHeight))
            imageView.image = value
            scrollView.addSubview(imageView)
        }
        scrollView.contentSize = CGSize(width: contentWidth * CGFloat(images.count), height: contentHeight)
    }
    
}
