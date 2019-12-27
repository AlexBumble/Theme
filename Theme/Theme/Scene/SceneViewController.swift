//
//  ViewController.swift
//  Theme
//
//  Created by Алексей Бузов on 27.12.2019.
//  Copyright © 2019 Alexey Buzov. All rights reserved.
//

import UIKit

class SceneViewController: UIViewController {

    let sceneCiew = SceneView()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func loadView() {
        view = sceneCiew
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

