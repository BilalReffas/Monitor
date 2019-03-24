//
//  ViewController.swift
//  Monitor
//
//  Created by Bilal Karim Reffas on 24.03.19.
//  Copyright © 2019 Bilal Karim Reffas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Monitor().startMonitoring { [weak self] connection, reachable in
            guard let strongSelf = self else { return }
            strongSelf.doSomething(connection, reachable: reachable)
        }
    }

    private func doSomething(_ connection: Connection, reachable: Reachable) {
        print("Current Connection : \(connection) Is reachable: \(reachable)")
    }
}
