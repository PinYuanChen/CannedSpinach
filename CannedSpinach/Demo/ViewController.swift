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
        setupNavigation()
        setupTableView()
    }
    
    func setupNavigation() {
        let label = UILabel()
        label.text = "Demo"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        navigationItem.leftBarButtonItem = .init(customView: label)
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
        DemoList.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.use(table: tableView, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        let demo = DemoList.allCases[indexPath.row]
        cell.textLabel?.text = demo.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DemoList.allCases[indexPath.row].viewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

