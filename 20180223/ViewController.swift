//
//  ViewController.swift
//  20180223
//
//  Created by student on 2018/2/23.
//  Copyright © 2018年 TNFSH104. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,AddNewItemDelegate,UISearchBarDelegate {


    //當鍵盤跳出時畫面上推
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    var shops = [Shop]()
    var filtedShops = [Shop]()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtedShops.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblShop.dequeueReusableCell(withIdentifier: "cellReminder") as! ShopsTableViewCell
        cell.Title?.text = filtedShops[indexPath.row].name
        cell.Adress?.text = filtedShops[indexPath.row].adress
        cell.caImage?.image = filtedShops[indexPath.row].caImage
        
        return cell
    }
    
    @IBOutlet weak var tblShop: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tblShop.dataSource = self
        tblShop.delegate = self
        searchBar.delegate = self
        shops.append(Shop(name: "瑪莎羅芙咖啡館", adress: "台南市東區大學路西段53號3樓", phoneNumber: "06-275-9318", shopImage: #imageLiteral(resourceName: "瑪莎羅芙咖啡館"), caImage: #imageLiteral(resourceName: "food")))
        shops.append(Shop(name: "弘揚日式餐館(井丸)", adress: "台南市東區大學路18巷15-3號一樓", phoneNumber: "0985-896-519", shopImage: #imageLiteral(resourceName: "弘陽日式餐館 丼丸"), caImage: #imageLiteral(resourceName: "food")))
        shops.append(Shop(name: "御私藏(成大店)", adress: "台南市東區育樂街17號", phoneNumber: "06-209-2929", shopImage: #imageLiteral(resourceName: "御私藏(成大店)"), caImage: #imageLiteral(resourceName: "food")))
        shops.append(Shop(name: "IS義式餐廳", adress: "台南市東區大學路22巷2號", phoneNumber: "06-209-9292", shopImage: #imageLiteral(resourceName: "Is義式餐廳"), caImage: #imageLiteral(resourceName: "food")))
        shops.append(Shop(name: "韓佶", adress: "台南市東區育樂街22號", phoneNumber: "0965-027-889", shopImage:#imageLiteral(resourceName: "韓佶"), caImage: #imageLiteral(resourceName: "food")))
        shops.append(Shop(name: "加依軒", adress: "台南市東區育樂街42號", phoneNumber: "06-236-9666", shopImage:#imageLiteral(resourceName: "加依軒"), caImage: #imageLiteral(resourceName: "food")))
        shops.append(Shop(name: "多拿滋創意料理", adress: "台南市東區育樂街53號", phoneNumber: "06-236-3281", shopImage:#imageLiteral(resourceName: "多拿滋創意料理"), caImage: #imageLiteral(resourceName: "food")))
        shops.append(Shop(name: "LDS 3C手機配件", adress: "台南市東區育樂街53-1號", phoneNumber: "0968-649-027", shopImage:#imageLiteral(resourceName: "LDS 3C手機配件"), caImage: #imageLiteral(resourceName: "tablet")))
        shops.append(Shop(name: "櫻桃菓子茶飲育樂店", adress: "台南市東區育樂街176號", phoneNumber: "06-276-3450", shopImage:#imageLiteral(resourceName: "櫻桃菓子茶飲育樂店"), caImage: #imageLiteral(resourceName: "latte")))
        shops.append(Shop(name: "AJ burger", adress: "台南市東區育樂街200號", phoneNumber: "06-209-5171", shopImage:#imageLiteral(resourceName: "AJ burger"), caImage: #imageLiteral(resourceName: "food")))
        shops.append(Shop(name: "茗茶園<天使咖啡>", adress: "台南市東區育樂街46巷2號", phoneNumber: "06-200-3688", shopImage:#imageLiteral(resourceName: "茗茶園-天使咖啡"), caImage: #imageLiteral(resourceName: "latte")))
        shops.append(Shop(name: "阿閔現炒", adress: "台南市東區育樂街171巷10號2樓", phoneNumber: "0965-645-593", shopImage:#imageLiteral(resourceName: "阿閔現炒"), caImage: #imageLiteral(resourceName: "food")))
        shops.append(Shop(name: "家鄉碳烤香雞排", adress: "台南市東區育樂街171巷10號1樓", phoneNumber: "0988-617-602", shopImage:#imageLiteral(resourceName: "家鄉碳烤香雞排"), caImage: #imageLiteral(resourceName: "food")))
        shops.append(Shop(name: "美捷馨影印店", adress: "台南市東區勝利路6號", phoneNumber: "06-236-8948", shopImage:#imageLiteral(resourceName: "美捷馨影印店"), caImage: #imageLiteral(resourceName: "printer")))
        shops.append(Shop(name: "風車簡餐", adress: "台南市東區勝利路14號", phoneNumber: "06-234-0773", shopImage:#imageLiteral(resourceName: "風車簡餐"), caImage: #imageLiteral(resourceName: "food")))
        shops.append(Shop(name: "我是你的飯 I`m your rice", adress: "台南市東區勝利路27號", phoneNumber: "06-208-6086", shopImage:#imageLiteral(resourceName: "我是你的飯 I`m your rice"), caImage: #imageLiteral(resourceName: "food")))
        shops.append(Shop(name: "吳家紅茶冰", adress: "台南市東區勝利路50-3號", phoneNumber: "0979-904-646", shopImage:#imageLiteral(resourceName: "吳家紅茶冰"), caImage: #imageLiteral(resourceName: "latte")))
        shops.append(Shop(name: "馬雅影印", adress: "台南市東區勝利路137號", phoneNumber: "06-236-6137", shopImage:#imageLiteral(resourceName: "馬雅影印"), caImage: #imageLiteral(resourceName: "printer")))
        shops.append(Shop(name: "Hot!手工窯烤披薩", adress: "台南市東區勝利路52巷1號", phoneNumber: "06-238-7588", shopImage:#imageLiteral(resourceName: "Hot!手工窯烤披薩"), caImage: #imageLiteral(resourceName: "food")))

        

        filtedShops = shops
    }
    //讓被選中的row從灰色變回白色
    override func viewWillAppear(_ animated: Bool) {
        if let index = self.tblShop.indexPathForSelectedRow{
            self.tblShop.deselectRow(at: index, animated: true)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //傳資料到另一個view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue"{
        let indexpath : NSIndexPath = tblShop.indexPathForSelectedRow! as NSIndexPath
        let target = segue.destination as! detailViewController
        target.getimage = filtedShops[indexpath.row].shopImage
        target.getshopname = filtedShops[indexpath.row].name
        target.getshopphone = filtedShops[indexpath.row].phoneNumber
        target.getshopadress = filtedShops[indexpath.row].adress
        }else if segue.identifier == "addSegue"{
            let target = segue.destination as! AddViewController
            target.delegate=self
        }
        
    }
    //新增資料到陣列FUNCTION
    func NewItem(name: String, image: UIImage, phone: String, adress: String, caimage: UIImage) {
        self.shops.append(Shop(name: name, adress: adress, phoneNumber: phone, shopImage: image, caImage: caimage))
        self.filtedShops = self.shops
        tblShop.reloadData()
    }
    //tableview刪資料
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteThisCell(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    //刪資料function
    func deleteThisCell(at indexPath: IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .destructive, title: "刪除") { (action, view, completion) in
            self.shops.remove(at: indexPath.row)
            self.filtedShops = self.shops
            self.tblShop.reloadData()
        }
        action.backgroundColor = .red
        return action
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
            self.filtedShops = self.shops
        }else{
            self.filtedShops = self.shops.filter({
                $0.name.contains(searchText)
            })
        }
        tblShop.reloadData()
    }

}

