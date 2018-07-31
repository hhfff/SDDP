//
//  BookingUIViewController.swift
//  SDDP
//
//  Created by hhf on 8/7/18.
//  Copyright © 2018 ITP312. All rights reserved.
//

import UIKit
/*protocol DateSelectDelegate:class{
    func dateSelected(date:Date)
}*/
import FirebaseDatabase
/*protocol FacilitySelectDelegate{
    func facilitySelected(facility:Facility)
}*/
class BookingUIViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    var facilityList:[Facility]!
    var cc:CommunityCenter!
    var userName="user2"
    var slotBackUp:[String]? // for date change only
    var selectedFacility:Facility?
     var ref: DatabaseReference!
    var bookedList=[String]()
    
    @IBOutlet weak var availableSlotTableView: UITableView!
    
    @IBOutlet weak var facilityLabel: UILabel!
   
    @IBOutlet weak var dateLabel: UILabel!
    
    var dateChoose:Date?
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    
        cc=CommunityCenter(1,"Ang Mo Kio CC","1 YISHUN AVE 9 768893","62570446, 62579429","N.A","9.00 am – 10.00 pm")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    /*func dateSelected(date:Date){
        print("hello")
        let formatter=DateFormatter()
        formatter.dateFormat="dd-MM-yyyy"
        let str=formatter.string(from: date)
        print(str)
        updateLabel()
        
    }*/
    func getDateInString(date:Date)->String{
        let formatter=DateFormatter()
        formatter.dateFormat="dd-MM-yyyy"
        let str=formatter.string(from: date)
        return str
        
    }
    func dateSelect(date:Date){
        
        dateChoose=date
      
        updateLabel()
        
        
    }
    func facilitySelected(facility: Facility) {
        selectedFacility=facility
        slotBackUp=facility.slot
        //backUpFacility=selectedFacility?.copy() as! Facility
        updateLabel()
    }
    func updateLabel(){
        if let d=dateChoose{
            
            dateLabel.text=getDateInString(date: d)
        }
    
       
        if let facilityName=selectedFacility?.name{
            facilityLabel.text=facilityName
        }
    }
    func loadAvailableSlot(){
        bookedList.removeAll()
        print("\(slotBackUp!.count):  \(selectedFacility?.slot.count)")
        selectedFacility?.slot=slotBackUp!
        
        // remove the existing slot with booked already
        ref.child("bookedFacility").child(cc!.name).observe(.value, with: { (snapshot) in
            //print("retrive data")
            
            if let value=snapshot.value as? NSDictionary{
                if let bookedFacility = value[self.selectedFacility?.name] as? NSDictionary{
                    //print("before choose date")
                    if let date=self.dateChoose{
                    //print("after choose date")
                        if let bookedFacilityDate=bookedFacility[self.getDateInString(date: date)] as? NSDictionary{
                            //print("before remove:\(self.selectedFacility?.slot.count)")
                            for (key,value) in bookedFacilityDate{
                                let bookedSlot=key as! String
                                if let allSlot=self.selectedFacility?.slot{
                                    for slot in allSlot{
                                       
                                        if slot == bookedSlot {
                                            
                                            var facil=self.selectedFacility?.slot
                                            let index=facil?.index(of: slot)
                                            
                                            self.selectedFacility?.slot.remove(at: index!)
                                        }
                        
                                    }
                                    //print("after remove:\(self.selectedFacility?.slot.count)")
                        
                                }
                        
                            }
                        }
                    }
                }
                
            }
            DispatchQueue.main.async {
                self.availableSlotTableView.reloadData()
                
                
                //self.update2()
            }
            
        })
        
    }
    @IBAction func onBookingBtnPressed(_ sender: Any) {
        let databaseRef=ref.child("bookedFacility").child(cc!.name).child(selectedFacility!.name).child(getDateInString(date: dateChoose!))
        var dataDict=[String:Any]()
        var bookDetail=[String:Any]()
        bookDetail.updateValue(userName, forKey: "username")
        bookDetail.updateValue(selectedFacility!.fee, forKey: "fee")
        bookDetail.updateValue(selectedFacility!.feeType, forKey: "feeType")
        
        for item in bookedList{
            dataDict.updateValue(bookDetail,forKey:item)
        }
        databaseRef.updateChildValues(dataDict)
        bookedList.removeAll()
        
            
        
        
    }
    
    @IBAction func chooseDate(_ sender: Any) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let rows=selectedFacility?.slot.count{
            return rows
        }
        return 0
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AvailableSlotCell
        if let data=selectedFacility?.slot{
            cell.label.text=data[indexPath.row]
            cell.label.textColor=UIColor.black
            cell.background.backgroundColor=UIColor.white
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath) as! AvailableSlotCell
       
        if let data=cell.label.text{
            if bookedList.contains(data){
                let index=bookedList.index(of: data)
                bookedList.remove(at: index!)
                cell.label.textColor=UIColor.black
                cell.background.backgroundColor=UIColor.white
                
            }else{
                cell.label.textColor=UIColor.white
                cell.background.backgroundColor=UIColor.blue
                bookedList.append(data)
                
            }
        }
        
    }
    
    

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "chooseDateSegue" {
        
            let controller = segue.destination as! ChooseDateViewController
            controller.bookingController=self
        
            
        }else if segue.identifier=="facilityChooseSegue"{
            let controller = segue.destination as! ChooseFacilityViewController
            controller.controller=self
            
        }
    }
 
   
   

}
