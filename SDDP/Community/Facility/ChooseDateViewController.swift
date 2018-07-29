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

    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onSaveSatePressed(_ sender: Any) {
        let date=datePicker.date
        print("start")
        bookingController?.dateSelect(date: date)
        print("end")
        
        //dateDelegate?.dateSelected(date: date)
        
        
        dismiss(animated: true)
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
