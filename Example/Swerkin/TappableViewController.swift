/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import UIKit

class TappableViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet var tapEventTriggered: UILabel!
    @IBOutlet var switchOne: UISwitch!
    @IBOutlet var switchTwo: UISwitch!
    @IBOutlet weak var contactUrl:  UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        switchOne.addTarget(self, action: #selector(onSwitchValueChanged), for: .valueChanged)
        switchTwo.addTarget(self, action: #selector(onSwitch2ValueChanged), for: .valueChanged)
        
        //Bar Button item
        let infoButton = UIButton(type: .infoLight)
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
        infoButton.accessibilityIdentifier = "infoButtonItemID"
        let infoBarButton = UIBarButtonItem(customView: infoButton)
        
        let doneBtn =  UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        doneBtn.accessibilityIdentifier = "doneButtonItemID"
        self.navigationItem.rightBarButtonItems = [doneBtn, infoBarButton]

        //Link
        contactUrl.attributedText = NSAttributedString(string: "Long Press", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        let contactUrlAction = UITapGestureRecognizer(target: self, action: #selector(self.contactUrlTapped(_:)))
        contactUrl.isUserInteractionEnabled = true
        contactUrl.addGestureRecognizer(contactUrlAction)
    }
    
    @objc func contactUrlTapped(_ sender: UITapGestureRecognizer) {
        tapEventTriggered.text = "Long Button Pressed"
    }

    @objc func onSwitchValueChanged(_ sender: UISwitch) {
        tapEventTriggered.text = sender.isOn ? "Switch1 is ON" : "Switch1 is OFF"
    }
    
    @objc func onSwitch2ValueChanged(_ sender: UISwitch) {
        tapEventTriggered.text = sender.isOn ? "Switch2 is ON" : "Switch2 is OFF"
    }
    
    @objc func doneButtonTapped() {
        tapEventTriggered.text = "Done bar button item"
    }
    
    @objc func infoButtonTapped() {

        // create the alert
        let alert = UIAlertController(title: "Title", message: "Info Button Pressed", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tickavtion(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        tapEventTriggered.text =  sender.isSelected ? "CheckBox tapped" : "CheckBox Untapped"
    }
    
    @IBAction func switchOnePressed(_ sender: UISwitch) {
        tapEventTriggered.text = sender.isOn ? "Switch1 is ON" : "Switch1 is OFF"
        switchTwo.setOn(!sender.isOn, animated: true)
    }

    @IBAction func switchTwoPressed(_ sender: UISwitch) {
        tapEventTriggered.text = sender.isOn ? "Switch2 is ON" : "Switch2 is OFF"
        switchOne.setOn(!sender.isOn, animated: true)
    }
    
    @IBAction func onShow(sender: UIButton) {
        guard let count = navigationController?.viewControllers.count else {
            return
        }
        if count > 2 {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "ButtonViewController") as! ButtonViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "popoverId") as? PopOverViewController {

                let navController = UINavigationController(rootViewController: viewController)
                navController.modalPresentationStyle = .popover


                if let pctrl = navController.popoverPresentationController {
                    pctrl.delegate = self

                    pctrl.sourceView = sender
                    pctrl.sourceRect = sender.bounds

                    self.present(navController, animated: true, completion: nil)
                }
            }
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController,
        traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        // Return no adaptive presentation style, use default presentation behaviour
        return .none
    }
}
