//
//  MainViewController.swift
//  Exam
//
//  Created by Montypass on 23.01.2021.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    /// Вызывается при изменении модели в деталке
    func didEndEditing()
}

class MainViewController: UIViewController {
    
    /// Константы
    private enum Constants {
        static let cellIdentifier = "imageCell"
        static let detailSegueIdentifier = "openDetailModal"
        static let nibName = "ImageCollectionViewCell"
        static let horizontalSpacing: CGFloat = 8
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let pictureManager: PictureManagerProtocol = PictureManager.shared
    private var items: [PictureItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            UINib(nibName: Constants.nibName, bundle: nil),
            forCellWithReuseIdentifier: Constants.cellIdentifier
        )
        reloadImages()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.detailSegueIdentifier,
           let item = sender as? PictureItem {
            let destination = segue.destination as! DetailViewController
            destination.configure(with: item, delegate: self)
        }
    }
    
    private func reloadImages() {
        items = pictureManager.getAll()
        collectionView.reloadData()
    }
}
//MARK: - Detail Delegate
extension MainViewController: DetailViewControllerDelegate {
    func didEndEditing() {
        reloadImages()
    }
}

//MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath) as! ImageCollectionViewCell
        cell.configure(with: items[indexPath.item])
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.detailSegueIdentifier, sender: items[indexPath.item])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - Constants.horizontalSpacing / 2
        let height = width * 2/3

        return CGSize(width: width, height: height)
    }
}

