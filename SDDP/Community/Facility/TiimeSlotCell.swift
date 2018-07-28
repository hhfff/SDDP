//
//  TiimeSlotCell.swift
//  SDDP
//
//  Created by hhf on 9/7/18.
//  Copyright © 2018 ITP312. All rights reserved.
//

import Foundation
import UIKit
class TimeSlotCell:UITableViewCell{
    private let topTimeLabel=UILabel()
    private let bottomTimeLabel=UILabel()
    
    private let separatorLine=UIView()
    
    var topTime:String=""{
        didSet{ topTimeLabel.text=topTime }
    }
    var bottomTime:String=""{
        didSet{bottomTimeLabel.text=bottomTime}
    }
    override init(style:UITableViewCellStyle,reuseIdentifier:String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(topTimeLabel)
        contentView.addSubview(bottomTimeLabel)
        contentView.addSubview(separatorLine)
        
        topTimeLabel.textColor=UIColor.gray
        topTimeLabel.textAlignment = .right
        bottomTimeLabel.textColor=UIColor.gray
        bottomTimeLabel.textAlignment = .right
        
        bottomTimeLabel.translatesAutoresizingMaskIntoConstraints=false
        topTimeLabel.translatesAutoresizingMaskIntoConstraints=false
        separatorLine.translatesAutoresizingMaskIntoConstraints=false
        
        NSLayoutConstraint.activate([
            bottomTimeLabel.leftAnchor.constraint(equalTo:self.leftAnchor,constant: 0),
            bottomTimeLabel.centerYAnchor.constraint(equalTo:self.bottomAnchor),
            bottomTimeLabel.widthAnchor.constraint(equalToConstant: 50),
            topTimeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            topTimeLabel.centerYAnchor.constraint(equalTo: self.topAnchor),
            topTimeLabel.widthAnchor.constraint(equalToConstant: 50),
            separatorLine.leftAnchor.constraint(equalTo: bottomTimeLabel.rightAnchor, constant: 8),
            separatorLine.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            separatorLine.heightAnchor.constraint(equalToConstant: 1),
            separatorLine.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            ])
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
