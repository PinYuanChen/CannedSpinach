//
//  XodiPlayTypeView.swift
//  CannedSpinach
//
//  Created by Patrick Chen on 2022/6/11.
//

import UIKit
import RxSwift
import RxCocoa

class XodiPlayTypeView: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 4
    }
    
    private let titleImage = UIImageView() --> {
        $0.image = UIImage(named: "bet-text-tai")
    }
    private let rateLabel = UILabel() --> {
        $0.text = "1.950"
        $0.textColor = .white
        $0.adjustsFontSizeToFitWidth = true
    }
    private let disposeBag = DisposeBag()
    private let wRatio = UIScreen.main.bounds.size.width / 375.0
    private let hRatio = UIScreen.main.bounds.size.height / 616.0
}

extension XodiPlayTypeView {
    func setupUI() {
        setupTitleImage()
        setupLabel()
    }
    
    func setupTitleImage() {
        addSubview(titleImage)
        titleImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10).multipliedBy(hRatio)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(20).multipliedBy(hRatio)
            $0.width.equalTo(33.68).multipliedBy(wRatio)
        }
    }
    
    func setupLabel() {
        addSubview(rateLabel)
        rateLabel.snp.makeConstraints {
            $0.top.equalTo(titleImage.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(19).multipliedBy(hRatio)
            $0.width.equalTo(36).multipliedBy(wRatio)
        }
    }
}
