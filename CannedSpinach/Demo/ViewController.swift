//
// Created on 2022/5/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let tableView = UITableView() --> {
        $0.register(UITableViewCell.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.use(table: tableView, for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
}

