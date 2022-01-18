//
//  GalleryCollectionView.swift
//  usplash-app
//
//  Created by  Matvey on 06.01.2022.
//

import UIKit

class GalleryCollectionVeiw: UICollectionView {
    
    private var cells = [SushiModel]()
    
    let layout = UICollectionViewFlowLayout()
    
    private var indexOfCellBeforeDragging = 0
    
    private struct Constants{
        static let leftDistanceToView: CGFloat = 20
        static let rightDistanceToView: CGFloat = 20
        static let minItemSpasing: CGFloat = 0
        static let swipeVelocityThreshold: CGFloat = 0.5
    }
    
    init() {
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = Constants.minItemSpasing
        super.init(frame: .zero, collectionViewLayout: layout)
//        contentInset = UIEdgeInsets(top: 0, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView)
        layout.sectionInset = UIEdgeInsets(top: 0, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView)
//        layout.itemSize =
        backgroundColor = .cyan
        register(GalleryCollectionViewCell.self,
                 forCellWithReuseIdentifier: GalleryCollectionViewCell.reuseId)
        delegate = self
        dataSource = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSushiModel(with cells: [SushiModel]) {
        self.cells = cells
    }
    
    private func indexOfMajorCell() -> Int {
        let itemWidth = layout.itemSize.width
        let index = Int(round((layout.collectionView?.contentOffset.x ?? 0) / itemWidth))
        
        let safeIndex = max(0, min(cells.count - 1, index))
        
        return safeIndex
    }
}

extension GalleryCollectionVeiw: UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        targetContentOffset.pointee = scrollView.contentOffset
        
        let indexOfMajorCell = indexOfMajorCell()
        
        let isCellChange = indexOfMajorCell != indexOfCellBeforeDragging
        
        let hasEnoughVelocityToSlideToTheNextCell = indexOfCellBeforeDragging + 1 < cells.count && velocity.x > Constants.swipeVelocityThreshold
        let hasEnoughVelocityToSlideToThePreviousCell = indexOfCellBeforeDragging - 1 >= 0 && velocity.x < -Constants.swipeVelocityThreshold
        
        let didUseSwipeToSkipCell = !isCellChange && (hasEnoughVelocityToSlideToTheNextCell || hasEnoughVelocityToSlideToThePreviousCell)
        
        if didUseSwipeToSkipCell {
            
            let snapToIndex = indexOfCellBeforeDragging + (hasEnoughVelocityToSlideToTheNextCell ? 1 : -1)
            let toValue = layout.itemSize.width * CGFloat(snapToIndex)
            // Damping equal 1 => no oscillations => decay animation:
//            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: velocity.x, options: .allowUserInteraction, animations: {
//            scrollView.contentOffset = CGPoint(x: toValue, y: 0)
//            scrollView.layoutIfNeeded()
//            }, completion: nil)
            let indexPath = IndexPath(row: snapToIndex, section: 0)
            scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        } else {
            let indexPath = IndexPath(row: indexOfMajorCell, section: 0)
            scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        indexOfCellBeforeDragging = indexOfMajorCell()
    }
}

extension GalleryCollectionVeiw: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.reuseId, for: indexPath) as? GalleryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.mainImageView.image = cells[indexPath.row].mainImage
        return cell
    }
}

extension GalleryCollectionVeiw: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSIze = CGSize(width: (frame.width - Constants.leftDistanceToView - Constants.rightDistanceToView), height: frame.height * 0.9)
        layout.itemSize = cellSIze
        return cellSIze
    }
}


