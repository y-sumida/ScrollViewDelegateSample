//
//  ViewController.swift
//  ScrollViewDelegateSample
//
//  Created by 住田祐樹 on 2017/06/30.
//  Copyright © 2017年 Yuki Sumida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDelegate {
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print("スクロール開始")
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("ドラッグ開始")
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate {
            print("指を離したけどまだ動いてる")
        }
        else {
            print("指を離して止まった")
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("スクロール停止")
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = ("row \(indexPath.row.description)")
        return cell
    }
}
