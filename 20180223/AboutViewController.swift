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
        myGifView.loadGif(name: "小白人4") //load gif
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnName(_ sender: UIButton) {
        let url = URL( string: "https://www.github.com/gnsJhenJie")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        //UIApplication.shared.openURL(url! as URL)
    }
    @IBAction func btnEmail(_ sender: UIButton) {
        let url = URL( string: "mailto:gnsjhenjie@gnsjhenjie.me")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        //UIApplication.shared.openURL(url! as URL)
    }
    @IBAction func btnTNFacebook(_ sender: Any) {
        let facebookUID = "318300822007799"
        let fbURLWeb = URL(string: "https://www.facebook.com/\(facebookUID)")!
        let fbURLID = URL(string: "fb://profile/\(facebookUID)")!
        
        if(UIApplication.shared.canOpenURL(fbURLID as URL)){
            // FB installed
            UIApplication.shared.open(fbURLID, options: [:], completionHandler: nil)
            //UIApplication.shared.openURL(fbURLID as URL)
        } else {
            // FB is not installed, open in safari
            UIApplication.shared.open(fbURLWeb, options: [:], completionHandler: nil)
            //UIApplication.shared.openURL(fbURLWeb as URL)
        }
        //let url = NSURL( string: "https://bit.ly/2vGgzdg")
        //UIApplication.shared.openURL(url! as URL)
    }
    @IBAction func btnFlatIcon(_ sender: UIButton) {
        let url = URL( string: "https://www.flaticon.com/")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        //UIApplication.shared.openURL(url! as URL)
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
