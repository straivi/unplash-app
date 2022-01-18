//
//  GalleryCollectionViewCell.swift
//  usplash-app
//
//  Created by  Matvey on 06.01.2022.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "GalleryCollectionViewCell"
    
    let mainImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .red
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(mainImageView)
        
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        let colllecionVeiwConstrainst = [
            mainImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            mainImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(colllecionVeiwConstrainst)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
