/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var firstCell: UITableViewCell!
    @IBOutlet var secondCell: UITableViewCell!
    @IBOutlet var thirdCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var message = "Apple Clicked"
        if indexPath.row == 1 {
            message = "Mango Clicked"
        } 
        let dialogMessage = UIAlertController(title: "Attention", message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            print("Ok button tapped");
        }
        dialogMessage.addAction(OKAction)
        self.present(dialogMessage, animated: true, completion: nil)
    }
}
