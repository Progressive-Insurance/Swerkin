/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import UIKit

class TextFieldViewController: UIViewController {
    
    @IBOutlet var doneButtonClickedLabel: UILabel!
    @IBOutlet weak var textfieldStackview: UIStackView!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var firstNameError: UILabel!
    @IBOutlet var infoTextView: UITextView!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var lastNameError: UILabel!

    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var doneButton = UIBarButtonItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        infoTextView.delegate = self
        let borderColor = UIColor.black.cgColor
        infoTextView.layer.cornerRadius = 10
        infoTextView.layer.borderWidth = 1.0
        infoTextView.layer.borderColor = borderColor
        self.setUpTextfieldStackView()
       
        addDoneButtonKeyboard(textField: self.firstNameTextField, textView: self.infoTextView , action: #selector(doneButtonPressed))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func doneButtonClicked(sender: UIButton) {
        self.doneButtonPressed()
    }
    
    @objc func doneButtonPressed() {
        self.firstNameTextField.endEditing(true)
        self.infoTextView.endEditing(true)
    }

    private func setUpTextfieldStackView() {
        let errorLabels = [firstNameError,
                           lastNameError]
        self.setUpErrorLabels(errorLabels: errorLabels)
    }

    private func setUpErrorLabels(errorLabels: [UILabel?]) {
        for errorLabel in errorLabels {
            let borderColor = UIColor.black.cgColor
            let backgroundColor = UIColor.red.cgColor
            errorLabel?.layer.backgroundColor = backgroundColor
            errorLabel?.layer.borderColor = borderColor
            errorLabel?.layer.borderWidth = 2.0
            errorLabel?.isHidden = true
        }
    }

    private func checkForValidCharset(text: String) -> Bool {
        let allowedSet = CharacterSet(charactersIn: letters)
        return text.rangeOfCharacter(from: allowedSet.inverted) == nil
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addDoneButtonKeyboard(textField: UITextField,textView: UITextView , action: Selector) {
        let toolbar = UIToolbar()
        doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: action)
        doneButton.accessibilityLabel = "done"

        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolbar.isTranslucent = true
        toolbar.barStyle = UIBarStyle.default
        toolbar.setItems([spaceButton, spaceButton, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        toolbar.sizeToFit()
        textField.inputAccessoryView = toolbar
        textView.inputAccessoryView = toolbar
    }
}

extension TextFieldViewController: UITextFieldDelegate, UITextViewDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if self.doneButton.isEnabled == false {
            self.doneButton.isEnabled = true
        }
        if checkForValidCharset(text: textField.text ?? "") {
            if textField.tag == 1 {
                self.firstNameError.isHidden = true
            } else {
                self.lastNameError.isHidden = true
            }
        } else {
            if textField.tag == 1 {
                self.firstNameError.isHidden = false
            } else {
                self.lastNameError.isHidden = false
            }
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if self.doneButton.isEnabled == false {
            self.doneButton.isEnabled = true
        }
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {        
        return true
    }
}
