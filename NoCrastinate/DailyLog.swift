//
//  DailyLog.swift
//  NoCrastinate
//
//  Created by Fara Yan on 2/25/20.
//  Copyright © 2020 Fara Yan. All rights reserved.
//

import UIKit

class DailyLog: UIViewController {
    
    let gesture = UITapGestureRecognizer(target: self, action: #selector(pressDailyLog(_:)))
    
    @IBAction func pressDailyLog(_ sender: Any) {
        pressed = false
        dismiss(animated: true, completion: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
