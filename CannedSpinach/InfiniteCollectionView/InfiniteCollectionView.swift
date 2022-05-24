//
// Created on 2022/5/24.
//

import UIKit

protocol InfiniteDelegate: UICollectionViewDataSource & UICollectionViewDelegateFlowLayout { }

class InfiniteCollectionView: UICollectionView {
    
    weak var infiniteDelegate: InfiniteDelegate?
    
    var infiniteScroll: Bool = false {
        didSet {
            reloadData()
            guard infiniteScroll else { return }
            
            scrollToItem(at: [1, 0], at: .left, animated: false)
        }
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
}

extension InfiniteCollectionView: InfiniteDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard infiniteScroll else {
            return 1
        }
        
        guard infiniteDelegate?.numberOfSections?(in: self) ?? 0 > 1 else {
            return 3
        }
        
        assert(false, "numberOfSections only 1.")
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        infiniteDelegate?.collectionView(self, numberOfItemsInSection: section) ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        infiniteDelegate?.collectionView(self, cellForItemAt: indexPath) ?? .init()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        infiniteDelegate?.collectionView?(self, layout: collectionViewLayout, sizeForItemAt: indexPath) ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        infiniteDelegate?.collectionView?(self, didSelectItemAt: indexPath)
    }

    // UIScrollViewDelegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard infiniteScroll else { return }
        
        let visibleRect = CGRect(origin: contentOffset, size: bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let visibleIndexPath = indexPathForItem(at: visiblePoint)
        
        guard let section = visibleIndexPath?.section, section != 1 else { return }
        
        scrollToItem(at: [1, visibleIndexPath?.item ?? 0], at: .left, animated: false)
    }
}

private extension InfiniteCollectionView {
    func setup() {
        isPagingEnabled = true
        dataSource = self
        delegate = self
    }
}

