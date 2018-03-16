//
//  detailViewController.swift
//  20180223
//
//  Created by student on 2018/3/9.
//  Copyright © 2018年 TNFSH104. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var labShopName: UILabel!
    @IBOutlet weak var labShopPhone: UILabel!
    @IBOutlet weak var labShopAdress: UILabel!
    var getimage = UIImage()
    var getshopname = String()
    var getshopphone = String()
    var getshopadress = String()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = getimage
        labShopName.text = getshopname
        labShopPhone.text = getshopphone
        labShopAdress.text = getshopadress
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
