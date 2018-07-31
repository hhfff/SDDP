//
//  ChooseDateViewController.swift
//  SDDP
//
//  Created by hhf on 24/7/18.
//  Copyright © 2018 ITP312. All rights reserved.
//

import UIKit

class ChooseDateViewController: UIViewController {
    //weak var dateDelegate:DateSelectDelegate?
    var bookingController:BookingUIViewController?

    @IBAction func onSavePressed(_ sender: Any) {
        let date=datePicker.date
        
        bookingController?.dateSelect(date: date)
        bookingController?.loadAvailableSlot()
    
        
        //dateDelegate?.dateSelected(date: date)
        
        
        dismiss(animated: true)
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.minimumDate=Date()
    
        

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
