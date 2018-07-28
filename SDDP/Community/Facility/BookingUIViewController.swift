//
//  BookingUIViewController.swift
//  SDDP
//
//  Created by hhf on 8/7/18.
//  Copyright © 2018 ITP312. All rights reserved.
//

import UIKit

class BookingUIViewController: UIViewController {
    var facilityList:[Facility]!
    var cc:CommunityCenter!
    var selectedFacility:Facility!


    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var facilityPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        cc=CommunityCenter(1,"Nee Soon South CC","1 YISHUN AVE 9 768893","62570446, 62579429","N.A","9.00 am – 10.00 pm")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        facilityList=FacilityFireBaseDao.getAllFacilityByCC(cc: cc)
        selectedFacility=facilityList[0]
        
        
        
        
    }

    @IBAction func chooseDate(_ sender: Any) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showTimeSlotSegue" {
            let controller = segue.destination as! ShowTimeSlotTableViewController
            controller.selectedFacility = self.selectedFacility;
            controller.selectedDate = self.datePicker.date
            
        }
    }
 
    //pickerview
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
   

}
