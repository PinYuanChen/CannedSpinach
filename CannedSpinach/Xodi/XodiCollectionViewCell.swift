//
//  XodiCollectionViewCell.swift
//  CannedSpinach
//
//  Created by Patrick Chen on 2022/6/11.
//

import UIKit
import RxSwift

class XodiCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let taiView = XodiPlayTypeView()
    private let xiuView = XodiPlayTypeView()
    private let leView = XodiPlayTypeView()
    private let chanView = XodiPlayTypeView()
    private let wRatio = UIScreen.main.bounds.size.width / 375.0
    private let hRatio = UIScreen.main.bounds.size.height / 616.0
    private let disposeBag = DisposeBag()
}

private extension XodiCollectionViewCell {
    func setupUI() {
        contentView.backgroundColor = .clear
        setupTaiView()
        setupXiuView()
        setupLeView()
        setupChanView()
    }
    
    func setupTaiView() {
        contentView.addSubview(taiView)
        taiView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10).multipliedBy(hRatio)
            $0.leading.equalToSuperview().offset(12).multipliedBy(wRatio)
            $0.width.equalTo(80).multipliedBy(wRatio)
            $0.height.equalTo(56).multipliedBy(hRatio)
        }
    }
    
    func setupXiuView() {
        contentView.addSubview(xiuView)
        xiuView.snp.makeConstraints {
            $0.size.centerY.equalTo(taiView)
            $0.leading.equalTo(taiView.snp.trailing).offset(10).multipliedBy(wRatio)
        }
    }
    
    func setupLeView() {
        contentView.addSubview(leView)
        leView.snp.makeConstraints {
            $0.size.centerY.equalTo(xiuView)
            $0.leading.equalTo(xiuView.snp.trailing).offset(5).multipliedBy(wRatio)
        }
    }
    
    func setupChanView() {
        contentView.addSubview(chanView)
        chanView.snp.makeConstraints {
            $0.size.centerY.equalTo(leView)
            $0.leading.equalTo(leView.snp.trailing).offset(2.5).multipliedBy(wRatio)
        }
    }
}

private extension XodiCollectionViewCell {
    func bind() {
        taiView
            .rx
            .tap
            .subscribe(onNext: { _ in
                print("tai")
            })
            .disposed(by: disposeBag)
    }
}
