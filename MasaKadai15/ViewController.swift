//
//  ViewController.swift
//  MasaKadai15
//
//  Created by Mina on 2023/06/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    private var items = Fruits.defaultItems
    private let checkMark = UIImage(named: "check-mark")

    @IBAction func save(segue: UIStoryboardSegue) {
        let secondVC = segue.source as? SecondViewController

        if let label = secondVC?.getInputText() {
            items.append((label, false))
            tableView.reloadData()
        }
    }

    @IBAction func cancel(segue: UIStoryboardSegue) {}
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let item = items[indexPath.row]
        cell.textLabel?.text = item.0
        cell.imageView?.image = item.1 ? checkMark : nil

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)

        if cell?.imageView?.image != nil {
            cell?.imageView?.image = nil
        } else {
            cell?.imageView?.image = checkMark
        }
    }
}
