//
//  ImageCollectionViewCell.swift
//  Exam
//
//  Created by Montypass on 23.01.2021.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var pictureNameLabel: UILabel!
    @IBOutlet weak var pictureDateLabel: UILabel!
    
    func configure(with item: PictureItem) {
        pictureImageView.image = UIImage(named: item.assetName)
        pictureNameLabel.text = item.displayName
        pictureDateLabel.text = item.createdAt
    }
}
