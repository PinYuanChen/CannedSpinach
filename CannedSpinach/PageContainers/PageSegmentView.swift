//
// Created on 2022/5/26.
//

import UIKit
import RxSwift
import RxCocoa

class PageSegmentView: UIView {

    let selectedIndex = BehaviorRelay<Int>(value: 0)
    let titles = BehaviorRelay<[String]>(value: [])
    
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
    
    private let underlineImageView = UIImageView()
    private let segmentSize = BehaviorRelay<CGSize>(value: .zero)
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private let collectionFlowLayout = UICollectionViewFlowLayout()
    private let disposeBag = DisposeBag()
}

// MARK: - Setup UI

private extension PageSegmentView {
    func setupUI() {
        setupFlowLayout()
        setupCollectionView()
        setupUnderlineImageView()
    }
    
    func setupFlowLayout() {
        collectionFlowLayout.scrollDirection = .horizontal
        collectionFlowLayout.sectionInset = .zero
    }
    
    func setupCollectionView() {
        collectionView.collectionViewLayout = collectionFlowLayout
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceHorizontal = false
        collectionView.alwaysBounceVertical = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PageSegmentCollectionViewCell.self)
        
        addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setupUnderlineImageView() {
        underlineImageView.alpha = 0
        collectionView.addSubview(underlineImageView)
        
    }
}

// MARK: - Bind

private extension PageSegmentView {
    func bind() {
        rx
            .observe(\.bounds.size)
            .bind(to: segmentSize)
            .disposed(by: disposeBag)
    }
}

// MARK: - Collection View Delegate

extension PageSegmentView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        titles.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let title = titles.value[indexPath.item]
        let cell = PageSegmentCollectionViewCell.use(collection: collectionView, for: indexPath)
        cell.titleText.accept(title)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let count = CGFloat(titles.value.count)
        guard count > 0 else { return .zero }
        
        let size = segmentSize.value
        //TODO: add spacing
        return .init(width: size.width / count, height: size.height)
    }
}
