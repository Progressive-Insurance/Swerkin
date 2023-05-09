/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import UIKit

class PopOverViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.preferredContentSize = CGSize(width: 320, height: 200)
            //sets the arrow of the popover to same color of background
        self.popoverPresentationController?.backgroundColor = self.view.backgroundColor
        self.preferredContentSize = CGSize(width: 200, height: 200)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismiss))
    }
    
    @objc func dismiss(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
}
