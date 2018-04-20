//
//  ViewController.swift
//  20180223
//
//  Created by student on 2018/2/23.
//  Copyright © 2018年 TNFSH104. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,AddNewItemDelegate,UISearchBarDelegate {



    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    var shops = [Shop]()
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shops.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblReminder.dequeueReusableCell(withIdentifier: "cellReminder") as! ShopsTableViewCell
        cell.Title?.text = shops[indexPath.row].name
        cell.Adress?.text = shops[indexPath.row].adress
        cell.caImage?.image = shops[indexPath.row].caImage
        
        return cell
    }
    
    @IBOutlet weak var tblReminder: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tblReminder.dataSource = self
        tblReminder.delegate = self
        shops.append(Shop(name: "好好吃餐廳", adress: "台南市", phoneNumber: "06-2755920", shopImage: #imageLiteral(resourceName: "noImage"), caImage: #imageLiteral(resourceName: "food")))
        shops.append(Shop(name: "蟹堡王", adress: "比奇堡", phoneNumber: "02-38758787", shopImage: #imageLiteral(resourceName: "蟹堡王"), caImage: #imageLiteral(resourceName: "food")))
        shops.append(Shop(name: "哈哈衣服", adress: "高雄市", phoneNumber: "07-3425555", shopImage: #imageLiteral(resourceName: "noImage"), caImage: #imageLiteral(resourceName: "noImage")))
        shops.append(Shop(name: "美食廣場？", adress: "新北市", phoneNumber: "02-94878794", shopImage: #imageLiteral(resourceName: "noImage"), caImage: #imageLiteral(resourceName: "food")))
        shops.append(Shop(name: "海之霸", adress: "比奇堡", phoneNumber: "0800-080-123", shopImage: #imageLiteral(resourceName: "海之霸"), caImage: #imageLiteral(resourceName: "food")))

        
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
        target.getimage = shops[indexpath.row].shopImage
        target.getshopname = shops[indexpath.row].name
        target.getshopphone = shops[indexpath.row].phoneNumber
        target.getshopadress = shops[indexpath.row].adress
        }else if segue.identifier == "addSegue"{
            let target = segue.destination as! AddViewController
            target.delegate=self
        }
        
    }
    func NewItem(name: String, image: UIImage, phone: String, adress: String, caimage: UIImage) {
        self.shops.append(Shop(name: name, adress: adress, phoneNumber: phone, shopImage: image, caImage: caimage))
        tblReminder.reloadData()
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteThisCell(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    func deleteThisCell(at indexPath: IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .destructive, title: "刪除") { (action, view, completion) in
            self.shops.remove(at: indexPath.row)
            self.tblReminder.reloadData()
        }
        action.backgroundColor = .red
        return action
    }

}

