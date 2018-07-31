//
//  BookedFacilityTableViewController.swift
//  SDDP
//
//  Created by hhf on 8/7/18.
//  Copyright © 2018 ITP312. All rights reserved.
//

import UIKit
import FirebaseDatabase
class BookedFacilityTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    var ref: DatabaseReference!
    var removeRef:DatabaseReference!
    var bookedData=[BookedFacilityData]()
    let userName="user2"
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidAppear(_ animated: Bool) {
        
        tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        removeRef=Database.database().reference()
        loadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    func loadData(){
        
        ref.child("bookedFacility").observe(.value, with: { (snapshot) in
            //print("retrive data")
            self.bookedData.removeAll()
            if let value=snapshot.value as? NSDictionary{
                for(ccName,val) in value{
                   
                    if let facilityDetail=val as? NSDictionary{
                        for (facilityName,bookSlot) in facilityDetail{
                            if let dateSlot = bookSlot as? NSDictionary{
                                for (slotName,slotDetail) in dateSlot{
                                    if let last=slotDetail as? NSDictionary{
                                        for (key,va) in last{
                                            let s=va as! NSDictionary
                                            let slotUser = s["username"] as! String
                                            if slotUser == self.userName{
                                                let fee = s["fee"] as! Double
                                                let feetype=s["feeType"] as! String
                                                let date=self.getDateFromString(str: slotName as! String)
                                                self.bookedData.append(BookedFacilityData(userName:slotUser,fee:fee,feeType:feetype,slot:key as! String,facilityName:facilityName as! String,ccName:ccName as! String,date:date))
                                                
                                            }
                                        }
                                        
                                    }
                                }
                            }
                            
                        }
                    }
                    
                }
                
                
                
            }
            // sort by date
            self.bookedData=self.bookedData.sorted(by: {$0.date!.compare($1.date!) == .orderedAscending})
            
            
            DispatchQueue.main.async {
                //print("\(self.bookedData.count) dispatch ")
                self.tableView.reloadData()
                
                //self.update2()
            }
            
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getDateInString(date:Date)->String{
        let formatter=DateFormatter()
        formatter.dateFormat="dd-MM-yyyy"
        let str=formatter.string(from: date)
        return str
        
    }
    func getDateFromString(str:String)->Date{
        let formatter=DateFormatter()
        formatter.dateFormat="dd-MM-yyyy"
        let date=formatter.date(from: str)
        return date!
        
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bookedData.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookedSlotCell
        let data=bookedData[indexPath.row]
        cell.facility.text="\(data.facilityName!) (\(data.ccName!))"
        cell.date.text="\(getDateInString(date: data.date!)) (\(data.slot!))"
        //cell.detailTextLabel?.text=


        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            removeBooking(booking: bookedData[indexPath.row])
            //print("\(bookedData.count ) tttttttt")
            bookedData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
        }
    }
    func removeBooking(booking:BookedFacilityData){
        let dateStr=getDateInString(date: booking.date!)
        removeRef.child("bookedFacility").child(booking.ccName!).child(booking.facilityName!).child(dateStr).child(booking.slot!).removeValue()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // no idea why cell height become default, nvm , set it here
        return 88
    }
    
    

}
