//
// Created on 2022/5/24.
//

import Foundation
import UIKit

enum DemoList: Int, CaseIterable {
    case infiniteCollectionView
    case blinkGrid
    case pageContainer
    case countDownTimer
    case gameProgressBar
    case threeDimensionBanner
}

extension DemoList {
    var title: String {
        switch self {
        case .infiniteCollectionView:
            return "無限滾動CollectionView"
        case .blinkGrid:
            return "閃爍表格"
        case .pageContainer:
            return "多頁框架"
        case .countDownTimer:
            return "倒數計時器"
        case .gameProgressBar:
            return "比賽進度條"
        case .threeDimensionBanner:
            return "3D廣告"
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case.infiniteCollectionView:
            return DemoInfiniteCollectionViewController()
        case .blinkGrid:
            return DemoBlinkGridViewController()
        case .pageContainer,
                .countDownTimer,
                .gameProgressBar,
                .threeDimensionBanner:
            return .init()
        }
    }
}
