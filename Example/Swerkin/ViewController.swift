/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func textFieldTestingButton(sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "TextFieldViewController") as! TextFieldViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func swipeTestingButton(sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SwipeController") as! SwipeController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func checkBoxTestingButton(sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "TappableViewController") as! TappableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func ButtonTesting(sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ButtonViewController") as! ButtonViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func DropdownTesting(sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "DropdownController") as! DropDownViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func waitToSee(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "WaitToSeeViewController") as! WaitToSeeViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func EndToEnd(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "EndToEndViewController") as! EndToEndViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func TableView(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
