//
//  AddViewController.swift
//  20180223
//
//  Created by student on 2018/3/16.
//  Copyright © 2018年 TNFSH104. All rights reserved.
//

import UIKit

protocol AddNewItemDelegate {
    func NewItem (name: String,image: UIImage, phone: String,adress: String,caimage: UIImage)
}


class AddViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    var cat = ["餐廳","服飾店","3C用品","影印店","飲料店"]
    var caImage = [#imageLiteral(resourceName: "food"),#imageLiteral(resourceName: "shirt"),#imageLiteral(resourceName: "tablet"),#imageLiteral(resourceName: "printer"),#imageLiteral(resourceName: "latte")]

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
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    var delegate: AddNewItemDelegate!
    //PickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cat.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        if component == 0 {
           pickerLabel.text = cat[row]
        }
        pickerLabel.font = UIFont(name: "System", size: 15)
        pickerLabel.textAlignment = NSTextAlignment.center
        return pickerLabel
    }
    //endEditing
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotification(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil) //test
        catPicker.delegate = self
        catPicker.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnSave(_ sender: UIButton) {
        let name = txtShopName.text!
        let image = imageViewer.image!
        let phone = txtPhone.text!
        let adress = txtAdress.text!
        let caimage = caImage[catPicker.selectedRow(inComponent: 0)]
        delegate.NewItem(name: name, image: image, phone: phone, adress: adress, caimage: caimage)
        navigationController?.popViewController(animated: true)
    }
    //選照片
    @IBAction func btnPickImage(_ sender: UIButton) {
        let picker = UIImagePickerController()
        let actionSheet = UIAlertController(title: nil,message: nil, preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "拍照", style: .default){ action in
            picker.sourceType = .camera
            self.present(picker, animated: true, completion: nil)
        }
        actionSheet.addAction(cameraAction)
        
        let libraryAction = UIAlertAction(title: "從圖片庫", style: .default){ action in
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
        }
        actionSheet.addAction(libraryAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){ action in
        }
        actionSheet.addAction(cancelAction)
        picker.delegate = self
        self.present(actionSheet, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let imagePicked = info["UIImagePickerControllerOriginalImage"] as! UIImage
        imageViewer.image = imagePicked
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var catPicker: UIPickerView!
    @IBOutlet weak var txtShopName: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtAdress: UITextField!
    @IBOutlet weak var imageViewer: UIImageView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
