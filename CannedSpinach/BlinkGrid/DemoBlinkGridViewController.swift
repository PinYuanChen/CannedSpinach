//
// Created on 2022/5/25.
//

import UIKit

class DemoBlinkGridViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private let blinkGridView = BlinkGridView()
    private let button = UIButton() --> {
        $0.setTitle("Trigger", for: .normal)
        $0.backgroundColor = .systemOrange
        $0.layer.cornerRadius = 3
    }
}

private extension DemoBlinkGridViewController {
    func setupUI() {
        setupBlinkGridView()
        setupButton()
    }
    
    func setupBlinkGridView() {
        view.addSubview(blinkGridView)
        blinkGridView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.8)
            $0.height.equalTo(self.blinkGridView.snp.width).multipliedBy(0.5)
        }
    }
    
    func setupButton() {
        button.addTarget(self, action: #selector(triggerBlinkView), for: .touchUpInside)
        
        view.addSubview(button)
        button.snp.makeConstraints {
            $0.top.equalTo(blinkGridView.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(40)
        }
    }
}

private extension DemoBlinkGridViewController {
    @objc func triggerBlinkView() {
        blinkGridView.triggerBlink()
    }
}
