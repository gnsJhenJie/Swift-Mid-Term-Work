//
//  AddViewController.swift
//  20180223
//
//  Created by student on 2018/3/16.
//  Copyright © 2018年 TNFSH104. All rights reserved.
//

import UIKit

protocol AddNewItemDelegate {
    func NewItem (name: String,image: UIImage, phone: String,adress: String)
}




class AddViewController: UIViewController {
    @objc func keyboardNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let keyboardFrame: CGRect = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            let duration: Double = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! Double
            
            UIView.animate(withDuration: duration, animations: { () -> Void in
                var frame = self.view.frame
                frame.origin.y = keyboardFrame.minY - self.view.frame.height
                self.view.frame = frame
            })
        }
    }//test
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    var delegate: AddNewItemDelegate!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotification(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil) //test

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnSave(_ sender: UIButton) {
        let name = txtShopName.text!
        let image = #imageLiteral(resourceName: "shirt")
        let phone = txtPhone.text!
        let adress = txtAdress.text!
        delegate.NewItem(name: name, image: image, phone: phone, adress: adress)
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var txtShopName: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtAdress: UITextField!
    @IBOutlet weak var image: UIImageView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
