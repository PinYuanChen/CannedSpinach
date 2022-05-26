//
// Created on 2022/5/24.
//

import UIKit

class DemoInfiniteCollectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.infiniteScroll = true
    }
    
    private let collectionMockData: [UIColor] = [.systemYellow, .systemGreen, .systemRed]
    private let collectionView = InfiniteCollectionView(frame: .zero,
                                                        collectionViewLayout: .init())
}

extension DemoInfiniteCollectionViewController: InfiniteDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionMockData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellItem = collectionMockData[indexPath.item]
        let cell = UICollectionViewCell.use(collection: collectionView, for: indexPath)
        cell.contentView.backgroundColor = cellItem

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.size.width,
              height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

private extension DemoInfiniteCollectionViewController {
    func setupUI() {
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let flowLayout: UICollectionViewFlowLayout = .init()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = .zero
        flowLayout.minimumLineSpacing = .zero
        
        collectionView.collectionViewLayout = flowLayout
        collectionView.backgroundColor = .clear
        collectionView.clipsToBounds = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self)
        collectionView.infiniteDelegate = self
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.height.equalTo(view.frame.height / 2)
            $0.leading.equalToSuperview()
            $0.center.equalToSuperview()
        }
    }
}
