//
//  MyCollectionViewCell.swift
//  NavigationControllerWithCode
//
//  Created by Yulya on 02.03.2023.
//
import Foundation
import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MyCollectionViewCell"
    let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBlue
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setup(title: String) {
        self.contentView.addSubview(self.title)
        self.title.frame = self.contentView.bounds
        self.title.text = title
    }
    
}
