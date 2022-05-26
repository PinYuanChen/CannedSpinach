//
// Created on 2022/5/26.
//

import UIKit
import RxSwift
import RxCocoa

class PageSegmentView: UIView {

    let selectedIndex = BehaviorRelay<Int>(value: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        bind()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        bind()
    }
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
}

private extension PageSegmentView {
    func setupUI() {
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.register(PageSegmentCollectionViewCell.self)
        
    }
}


private extension PageSegmentView {
    func bind() {
        
    }
}
