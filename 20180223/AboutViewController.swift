//
//  AboutViewController.swift
//  20180223
//
//  Created by gnsJhenJie on 2018/4/22.
//  Copyright © 2018年 TNFSH104. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var myGifView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myGifView.loadGif(name: "小白人4")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnName(_ sender: UIButton) {
        let url = NSURL( string: "https://www.github.com/gnsJhenJie")
        UIApplication.shared.openURL(url! as URL)
    }
    @IBAction func btnEmail(_ sender: UIButton) {
        let url = NSURL( string: "mailto:gnsjhenjie@gnsjhenjie.me")
        UIApplication.shared.openURL(url! as URL)
    }
    @IBAction func btnTNFacebook(_ sender: Any) {
        let facebookUID = "318300822007799"
        let fbURLWeb: NSURL = NSURL(string: "https://www.facebook.com/\(facebookUID)")!
        let fbURLID: NSURL = NSURL(string: "facebook://profile/\(facebookUID)")!
        
        if(UIApplication.shared.canOpenURL(fbURLID as URL)){
            // FB installed
            UIApplication.shared.openURL(fbURLID as URL)
        } else {
            // FB is not installed, open in safari
            UIApplication.shared.openURL(fbURLWeb as URL)
        }
        //let url = NSURL( string: "https://bit.ly/2vGgzdg")
        //UIApplication.shared.openURL(url! as URL)
    }
    @IBAction func btnFlatIcon(_ sender: UIButton) {
        let url = NSURL( string: "https://www.flaticon.com/")
        UIApplication.shared.openURL(url! as URL)
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
