//
//  CommunityViewController.swift
//  SDDP
//
//  Created by ITP312 on 21/6/18.
//  Copyright © 2018 ITP312. All rights reserved.
//

import UIKit
import FirebaseDatabase
protocol CCData{
    func updateCCInfo(cc:CommunityCenter)
}
class CommunityViewController: UIViewController,CCData{
    var cc:CommunityCenter?
    var ref: DatabaseReference!
    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    @IBOutlet weak var addrLabel: UILabel!
    @IBOutlet weak var openHourLabel: UILabel!
    
    @IBOutlet weak var eventButton: UIButton!
    @IBOutlet weak var facilityButton: UIButton!
    @IBOutlet weak var courseButton: UIButton!
    @IBOutlet weak var groupButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        let cornerRadius:CGFloat=10
        let borderWidth:CGFloat=1
        let black=UIColor(red: 117/255.0, green: 117/255.0, blue: 117/255.0, alpha: 1.0)
        groupButton.layer.borderWidth=borderWidth
        groupButton.layer.borderColor=black.cgColor
        groupButton.layer.cornerRadius=cornerRadius
        
        eventButton.layer.borderWidth=borderWidth
        eventButton.layer.borderColor=black.cgColor
        eventButton.layer.cornerRadius=cornerRadius
        
        facilityButton.layer.borderWidth=borderWidth
        facilityButton.layer.borderColor=black.cgColor
        facilityButton.layer.cornerRadius=cornerRadius
        
        courseButton.layer.borderWidth=borderWidth
        courseButton.layer.borderColor=black.cgColor
        courseButton.layer.cornerRadius=cornerRadius
        fetchCCInfo(ccName:"Ang Mo Kio CC")
        
        
        
        
        
        
        
    
        
        

        // Do any additional setup after loading the view.
    }
    func fetchCCInfo(ccName:String){
        
        
        ref.child("cc").child("\(ccName)").observe(.value, with: { (snapshot) in
            //print("retrive data")
            let value=snapshot.value as? NSDictionary
            let address=value?["address"] as? String
            let tel=value?["tel"] as? String
            let openHour=value?["openHour"] as? String
            let email=value?["email"] as? String
            let name=value?["name"] as? String
            self.cc=CommunityCenter(0,name!,address!,tel!,email!,openHour!)
           
            DispatchQueue.main.async {
                    //self.update2()
                    self.updateCCInfo(cc:self.cc!)
            }
            
        })
        
        
    }
    func update2(){
        nameLabel.text="xxxxxx"
    }
    func updateCCInfo(cc:CommunityCenter){
       
        print("update info \(cc.address)" )
        
        
        nameLabel.text=cc.name
        telLabel.text=cc.phoneNo
        emailLabel.text=cc.email
        addrLabel.text=cc.address
        openHourLabel.text=cc.operatingHour
        
        
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
