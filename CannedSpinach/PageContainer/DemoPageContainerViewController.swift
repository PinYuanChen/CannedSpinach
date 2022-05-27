//
// Created on 2022/5/27.
//

import UIKit
import RxSwift
import RxCocoa

class DemoPageContainerViewController: UIViewController {

    let segmentView = PageSegmentView()
    // input your custom titles
    let segmentTitles = ["Test 1", "Test 2", "Test 3"]
    let colors: [UIColor] = [.systemPink, .systemCyan, .systemMint]
    var vcs = [UIViewController]()
    let pageViewController = UIPageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
    }

    private var selectedIndex = 0
    private let disposeBag = DisposeBag()
}

private extension DemoPageContainerViewController {
    func setupUI() {
        view.backgroundColor = .black
        setupSegmentView()
        setupPageViewController()
    }
    
    func setupSegmentView() {
        segmentView.titles.accept(segmentTitles)
        view.addSubview(segmentView)
        
        segmentView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.centerX.equalToSuperview()
            $0.height.equalTo(60)
        }
    }
    
    func setupPageViewController() {
        for color in colors {
            let vc = UIViewController()
            vc.view.backgroundColor = color
            vcs.append(vc)
        }
        
        pageViewController.setViewControllers([vcs[0]], direction: .forward, animated: false, completion: nil)
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        view.addSubview(pageViewController.view)
        pageViewController.view.snp.makeConstraints {
            $0.top.equalTo(segmentView.snp.bottom)
            $0.leading.centerX.bottom.equalToSuperview()
        }
    }
}

private extension DemoPageContainerViewController {
    func bind() {
        segmentView
            .selectedIndex
            .withUnretained(self)
            .subscribe(onNext: { owner, index in
                owner.selectedIndex = index
            })
            .disposed(by: disposeBag)
    }
}

extension DemoPageContainerViewController: UIPageViewControllerDelegate,
                                           UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let preIndex = selectedIndex - 1
        guard preIndex >= 0 else { return nil }
        let vc = vcs[preIndex]
        return vc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let afterIndex = selectedIndex + 1
        guard afterIndex < vcs.count else { return nil }
        let vc = vcs[afterIndex]
        return vc
    }

    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let vc = pageViewController.viewControllers?.first
              else {
            return
        }
        guard let index = colors.firstIndex(of: vc.view.backgroundColor ?? .clear) else { return }
        segmentView.selectedIndex.accept(index)
    }
     
}
