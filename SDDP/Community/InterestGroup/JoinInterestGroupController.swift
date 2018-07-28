//
//  JoinInterestGroupController.swift
//  SDDP
//
//  Created by xinyu li on 26/6/18.
//  Copyright © 2018 ITP312. All rights reserved.
//

import UIKit

class JoinInterestGroupController: UIViewController, UITableViewDataSource{
    
    var interestedGroup:[InterestGroup]
    var user = User(1,"Ray","S12345","9876543","yishun ave 6")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let interestDatabase = InterestGroupFirebaseDao()
        interestedGroup = interestDatabase.getJoinedGroups(user: <#T##User#>)
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interestedGroup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = interestedGroup[indexPath.row].name
        return cell
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
