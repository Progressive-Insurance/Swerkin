/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import UIKit

class ButtonViewController: UIViewController {
    
    @IBOutlet var buttonClickedLabel: UILabel!
    @IBOutlet var disableButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.disableButton.isEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func enableButtonClicked(sender: UIButton) {
        sender.isHighlighted = true
        guard let count = navigationController?.viewControllers.count else {
            return
        }
        if count > 2 {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "DropdownController") as! DropDownViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            self.buttonClickedLabel.text = "Enable Button Clicked"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
