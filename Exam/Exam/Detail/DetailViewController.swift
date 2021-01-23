//
//  DetailViewController.swift
//  Exam
//
//  Created by Montypass on 23.01.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    private enum Constants {
        static let cornerRadius: CGFloat = 10
    }
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var pictureNameTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    private let pictureManager: PictureManagerProtocol = PictureManager.shared
    
    /// Текущая сущность картинки, которая показывается на детальном
    private var item: PictureItem!
    /// Делегат, метод которого вызывается при редактировании картинки
    private weak var delegate: DetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = Constants.cornerRadius
        deleteButton.layer.cornerRadius = Constants.cornerRadius
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pictureImageView.image = UIImage(named: item.assetName)
        pictureNameTextField.text = item.displayName
    }
    
    func configure(with item: PictureItem, delegate: DetailViewControllerDelegate?) {
        self.item = item
        self.delegate = delegate
    }
    
    @IBAction func didTapSaveButton(_ sender: Any) {
        guard let newName = pictureNameTextField.text else { return }
        pictureManager.edit(name: item.displayName, with: newName)
        if item.displayName != newName {
            delegate?.didEndEditing()
        }
        dismiss(animated: true)
    }
    @IBAction func didTapDeleteButton(_ sender: Any) {
        pictureManager.delete(by: item.displayName)
        delegate?.didEndEditing()
        dismiss(animated: true)
    }
}
