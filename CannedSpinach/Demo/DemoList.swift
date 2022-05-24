//
// Created on 2022/5/24.
//

import Foundation
import UIKit

enum DemoList: Int, CaseIterable {
    case infiniteCollectionView
}

extension DemoList {
    var title: String {
        switch self {
        case .infiniteCollectionView:
            return "無限滾動CollectionView"
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case.infiniteCollectionView:
            return DemoInfiniteCollectionViewController()
        }
    }
}
