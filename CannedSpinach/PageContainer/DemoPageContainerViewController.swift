//
// Created on 2022/5/27.
//

import UIKit

class DemoPageContainerViewController: UIViewController {

    let segmentView = PageSegmentView()
    // input your custom titles
    let segmentTitles = ["Test 1", "Test 2", "Test 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


}

private extension DemoPageContainerViewController {
    func setupUI() {
        view.backgroundColor = .black
        segmentView.titles.accept(segmentTitles)
        view.addSubview(segmentView)
        
        segmentView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.centerX.equalToSuperview()
            $0.height.equalTo(60)
        }
    }
}
