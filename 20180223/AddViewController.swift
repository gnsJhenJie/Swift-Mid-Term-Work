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
    
    var delegate: AddNewItemDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
