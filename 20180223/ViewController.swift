//
//  ViewController.swift
//  20180223
//
//  Created by student on 2018/2/23.
//  Copyright © 2018年 TNFSH104. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,AddNewItemDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    var ShopName = ["好好吃餐廳","蟹堡王","哈哈衣服","美食廣場？","海之霸"]
    var ShopAdress = ["台南市","比奇堡","高雄市","新北市","比奇堡"]
    var PhoneNumber = ["06-2755920","02-38758787","07-3425555","02-94878794","0800-080-123"]
    var caImage = [UIImage(named:"food"),UIImage(named:"food"),UIImage(named:"shirt"),UIImage(named:"shirt"),UIImage(named:"food")]
    var shopImage =  [#imageLiteral(resourceName: "noImage"),#imageLiteral(resourceName: "蟹堡王"),#imageLiteral(resourceName: "noImage"),#imageLiteral(resourceName: "noImage"),#imageLiteral(resourceName: "海之霸")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShopName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblReminder.dequeueReusableCell(withIdentifier: "cellReminder") as! ShopsTableViewCell
        cell.Title?.text = ShopName[indexPath.row]
        cell.Adress?.text = ShopAdress[indexPath.row]
        cell.caImage?.image = caImage[indexPath.row]
        
        return cell
    }
    
    @IBOutlet weak var tblReminder: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tblReminder.dataSource = self
        tblReminder.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        if let index = self.tblReminder.indexPathForSelectedRow{
            self.tblReminder.deselectRow(at: index, animated: true)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue"{
        let indexpath : NSIndexPath = tblReminder.indexPathForSelectedRow! as NSIndexPath
        let target = segue.destination as! detailViewController
        target.getimage = caImage[indexpath.row]!
        target.getshopname = ShopName[indexpath.row]
        target.getshopphone = PhoneNumber[indexpath.row]
        target.getshopadress = ShopAdress[indexpath.row]
        }else if segue.identifier == "addSegue"{
            let target = segue.destination as! AddViewController
            target.delegate=self
        }
        
    }
    func NewItem(name: String, image: UIImage, phone: String, adress: String) {
        ShopName.append(name)
        caImage.append(image)
        PhoneNumber.append(phone)
        ShopAdress.append(adress)
        tblReminder.reloadData()
    }

}

