/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import UIKit

class DropDownViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var textBox: UITextField!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var pickerHeightConstraint: NSLayoutConstraint!

    var arrayFruits = [String](arrayLiteral: "Select Fruit","Apple","Banana","Orange","Grapes","Watermelon")
    var arrayVeggies = [String](arrayLiteral: "Select Veggie","Asparagus","Broccoli","Carrots","Kale","Tomato")
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.pickerHeightConstraint.constant = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.hidesBackButton = true
        self.title = "Dropdown Testing"
        addDoneButtonKeyboard(pickerView: pickerView, textField: self.textBox , action: #selector(doneButtonPressed), actionCancel: #selector(cancelButtonPressed))
        pickerView.dataSource = self
        pickerView.delegate = self
        textBox.delegate = self
        textBox.inputView = pickerView
    }
    
    
    @objc func doneButtonPressed() {
        self.textBox.resignFirstResponder()
        if (self.textBox.text == "") {
        self.textBox.text = arrayFruits[1]
        }
    }
    
    @objc func cancelButtonPressed() {
        self.textBox.resignFirstResponder()
    }
    

    func addDoneButtonKeyboard(pickerView: UIPickerView , textField: UITextField , action: Selector, actionCancel :Selector) {
        let toolbar = UIToolbar()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: action)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: actionCancel)

        toolbar.isTranslucent = true
        toolbar.barStyle = UIBarStyle.default
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        toolbar.sizeToFit()
    
        textField.inputAccessoryView = toolbar
    }
    // MARK: - Pickerview method
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return arrayFruits.count
        } else {
            return arrayVeggies.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return arrayFruits[row]
        } else {
            return arrayVeggies[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            self.textBox.text = arrayFruits[row]
        } else {
            if let val = self.textBox.text {
                self.textBox.text = val + " "  + arrayVeggies[row]
            } else{
                self.textBox.text =  arrayVeggies[row]
            }
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.pickerHeightConstraint.constant = 225
        return true
    }
}
