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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setContent(images: [UIImage]) {
        let screenWidth = UIScreen.main.bounds.width
        scrollView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenWidth * 0.5)
        scrollView.backgroundColor = UIColor.gray
        containerView.addSubview(scrollView)
        
        for (index, value) in images.enumerated() {
            let imageView = UIImageView(frame: CGRect(x: 0, y: CGFloat(index) * screenWidth, width: screenWidth, height: screenWidth * 0.5))
            imageView.image = value
            scrollView.addSubview(imageView)
        }
    }
    
}
