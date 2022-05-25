//
// Created on 2022/5/25.
//

import UIKit

class BlinkGridView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addMiddleBorderView()
        addBottomBorderView()
    }
    
    private let topView1 = UIView()
    private let topView2 = UIView()
    private let topView3 = UIView()
    private let topView4 = UIView()
    private let topStackView = UIStackView()
    
    private let middleView1 = UIView()
    private let middleView2 = UIView()
    private let middleStackView = UIStackView()
    
    private let bottomView1 = UIView()
    private let bottomView2 = UIView()
    private let bottomStackView = UIStackView()
    
    public func triggerBlink() {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            UIView.setAnimationRepeatCount(3)
            self.middleView2.layer.shadowColor = UIColor.white.cgColor
            self.middleView2.layer.shadowOpacity = 1
            self.middleView2.layer.shadowRadius = 15
        } completion: { _ in
            self.middleView2.layer.shadowOpacity = 0
        }
    }
    
}

private extension BlinkGridView {
    
    func setupUI() {
        setupTopStackView()
        setupTopViews()
        setupMiddleStack()
        setupMiddtopView3s()
        setupBottomStack()
        setupBottomViews()
    }
    
    func setupTopStackView() {
        topStackView.axis = .horizontal
        topStackView.distribution = .fillEqually
        topStackView.spacing = -2
        addSubview(topStackView)
        topStackView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.8)
            $0.height.equalToSuperview().multipliedBy(0.2)
        }
    }
    
    func setupTopViews() {
        topView1.backgroundColor = .systemRed
        topView1.layer.borderWidth = 2
        topView1.layer.borderColor = UIColor.white.cgColor
        topView1.layer.cornerRadius = 10
        topView1.layer.maskedCorners = [.layerMinXMinYCorner]
        topStackView.addArrangedSubview(topView1)
        
        topView2.backgroundColor = .systemGreen
        topView2.layer.borderWidth = 2
        topView2.layer.borderColor = UIColor.white.cgColor
        topStackView.addArrangedSubview(topView2)
        
        topView3.backgroundColor = .systemBlue
        topView3.layer.borderWidth = 2
        topView3.layer.borderColor = UIColor.white.cgColor
        topStackView.addArrangedSubview(topView3)
        
        topView4.backgroundColor = .systemCyan
        topView4.layer.borderWidth = 2
        topView4.layer.borderColor = UIColor.white.cgColor
        topView4.layer.cornerRadius = 10
        topView4.layer.maskedCorners = [.layerMaxXMinYCorner]
        topStackView.addArrangedSubview(topView4)
    }
    
    func setupMiddleStack() {
        middleStackView.axis = .horizontal
        middleStackView.distribution = .fillEqually
        middleStackView.spacing = -2
        addSubview(middleStackView)
        middleStackView.snp.makeConstraints {
            $0.top.equalTo(topStackView.snp.bottom).offset(-2)
            $0.leading.centerX.equalTo(topStackView)
            $0.height.equalToSuperview().multipliedBy(0.4)
        }
    }
    
    func setupMiddtopView3s() {
        middleView1.backgroundColor = .systemMint
        middleView1.layer.borderWidth = 2
        middleView1.layer.borderColor = UIColor.white.cgColor
        middleStackView.addArrangedSubview(middleView1)
        
        middleView2.backgroundColor = .lightGray
        middleView2.layer.borderWidth = 2
        middleView2.layer.borderColor = UIColor.white.cgColor
        middleStackView.addArrangedSubview(middleView2)
    }
    
    func setupBottomStack() {
        bottomStackView.axis = .horizontal
        bottomStackView.distribution = .fillEqually
        bottomStackView.spacing = -2
        bottomStackView.layer.cornerRadius = 10
        addSubview(bottomStackView)
        bottomStackView.snp.makeConstraints {
            $0.top.equalTo(middleStackView.snp.bottom).offset(-2)
            $0.leading.centerX.equalTo(middleStackView)
            $0.height.equalToSuperview().multipliedBy(0.4)
        }
    }
    
    func setupBottomViews() {
        bottomView1.backgroundColor = .systemTeal
        bottomView1.layer.borderWidth = 2
        bottomView1.layer.borderColor = UIColor.white.cgColor
        bottomStackView.addArrangedSubview(bottomView1)
        bottomView1.layer.cornerRadius = 10
        bottomView1.layer.maskedCorners = [.layerMinXMaxYCorner]
        
        bottomView2.backgroundColor = .systemIndigo
        bottomView2.layer.borderWidth = 2
        bottomView2.layer.borderColor = UIColor.white.cgColor
        bottomView2.layer.cornerRadius = 10
        bottomStackView.addArrangedSubview(bottomView2)
        bottomView2.layer.maskedCorners = [.layerMaxXMaxYCorner]
    }
    
    func addMiddleBorderView() {
        let globalPoint = middleView1.convert(middleView1.bounds, to: self)
        let newView = UIView.init(frame: globalPoint)
        newView.backgroundColor = .clear
        newView.layer.borderColor = UIColor.yellow.cgColor
        newView.layer.borderWidth = 2
        addSubview(newView)
    }
    
    func addBottomBorderView() {
        let globalPoint = bottomView2.convert(bottomView2.bounds, to: self)
        let newView = UIView.init(frame: globalPoint)
        newView.backgroundColor = .clear
        newView.layer.borderWidth = 2
        newView.layer.borderColor = UIColor.yellow.cgColor
        newView.layer.cornerRadius = 10
        newView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        addSubview(newView)
    }
}
