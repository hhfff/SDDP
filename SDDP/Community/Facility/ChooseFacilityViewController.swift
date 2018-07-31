//
//  ChooseFacilityViewController.swift
//  SDDP
//
//  Created by hhf on 29/7/18.
//  Copyright © 2018 ITP312. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
class ChooseFacilityViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    var controller:BookingUIViewController?
    var selectedFacility:Facility?
    var cc:CommunityCenter?
     var ref: DatabaseReference!
    var storageRef:StorageReference?
    

    @IBOutlet weak var imageView: UIImageView!
    var facilities=[Facility]()
    
    @IBAction func onChoosePress(_ sender: Any) {
        controller?.facilitySelected(facility: selectedFacility!)
        controller?.loadAvailableSlot()
        dismiss(animated: true)
    }
    
    @IBOutlet weak var pickerView: UIPickerView!
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return facilities.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return facilities[row].name
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedFacility=facilities[row]
        imageView.image=facilities[row].image
        imageView.setNeedsDisplay()
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storage=Storage.storage()
        storageRef=storage.reference()
        
        ref = Database.database().reference()
        
        
        cc=CommunityCenter(1,"Ang Mo Kio CC","1 YISHUN AVE 9 768893","62570446, 62579429","N.A","9.00 am – 10.00 pm")
        
        ref.child("facility").child(cc!.name).observe(.value, with: { (snapshot) in
            //print("retrive data")
            let value=snapshot.value as? NSDictionary
            
            
            for (key,detail) in value!{
                let name=key as! String
                let facilityDetail = detail as! NSDictionary
                let feeInfo=facilityDetail["fee"] as! NSDictionary
                let fee=feeInfo["value"] as! Double
                let feeType=feeInfo["type"] as! String
                let allSlot=facilityDetail["timeSlot"] as! NSArray
                var s=[String]() //all the slot
                for item in allSlot {
                    
                    s.append(item as! String)
                    
                }
                
                //image
                
                let imageName=facilityDetail["image"] as! String
                self.facilities.append(Facility(0,name,fee:fee,feeType:feeType,slot:s,imageName:imageName))
            }
            for index in 0..<self.facilities.count{
                let imageRef=self.storageRef?.child("facility/\(self.facilities[index].imageName!)")
                imageRef?.getData(maxSize: 1*1024*1024) { data, error in
                    if let error = error{
                        print(error)
                    }
                    else{
                        let image=UIImage(data:data!)
                        self.facilities[index].image=image!
                        
                    }
                }
                
            }
           
            
            
            
            
            DispatchQueue.main.async {
                self.selectedFacility=self.facilities[0]
                self.pickerView.reloadAllComponents()
                if let pic=self.facilities[0].image{
                    self.imageView.image=pic
                    self.imageView.setNeedsDisplay()
                }
                
                    
                
                
                //self.update2()
                
            }
            
        })
        
        
        
                
            
        
        

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
