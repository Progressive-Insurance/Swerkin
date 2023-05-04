/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import UIKit

class WaitToSeeViewController: UIViewController {


    @IBOutlet weak var loader: UIButton!
    @IBOutlet weak var scrollLoader: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var fifthLabel: UILabel!
    @IBOutlet weak var sixthLabel: UILabel!
    @IBOutlet weak var switchItem: UISwitch!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var alertButton: UIButton!
    var alert: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func load(_ sender: Any) {
        guard let count = navigationController?.viewControllers.count else {
            return
        }
        if count > 2 {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "TappableViewController") as! TappableViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            scrollLoader.isHidden = false
        }
    }

    @IBAction func scrollLoad(_ sender: Any) {
        secondLabel.isHidden = false
        thirdLabel.isHidden = false
        switchItem.isHidden = false
        switchItem.isEnabled = true
        firstImage.isHidden = false
        secondImage.isHidden = false
        fourthLabel.isHidden = false
        fifthLabel.isHidden = false
        sixthLabel.isHidden = false
        scrollLoader.isEnabled = false
        alertButton.isHidden = false
    }
    @IBAction func toggleLabels(_ sender: Any) {
        firstLabel.isHidden = !firstLabel.isHidden
        sixthLabel.isHidden = !sixthLabel.isHidden
    }

    @IBAction func showAlert(_ sender: Any) {
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        cancelAction.accessibilityLabel = "Cancel"
        let alertViewController = UIAlertController(title: "Alert", message: "This is a test alert", preferredStyle: .alert)
        alertViewController.view.accessibilityIdentifier = "wait_to_see_alert"
        self.alert = alertViewController.view
        alertViewController.addAction(cancelAction)
        self.present(alertViewController,
                     animated: true,
                     completion: nil)
    }
}
