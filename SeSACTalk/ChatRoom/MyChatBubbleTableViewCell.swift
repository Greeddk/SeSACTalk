//
//  MyChatBubbleTableViewCell.swift
//  SeSACTalk
//
//  Created by Greed on 1/14/24.
//

import UIKit

class MyChatBubbleTableViewCell: UITableViewCell {
    
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    static var identifier = "MyChatBubbleTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}

extension MyChatBubbleTableViewCell {
    
    func setUI() {
        
        chatLabel.backgroundColor = .systemGray2
        chatLabel.layer.cornerRadius = 10
        chatLabel.layer.borderWidth = 1
        chatLabel.layer.borderColor = UIColor.systemGray.cgColor
        chatLabel.textColor = .black
        chatLabel.numberOfLines = 0
        
        timeLabel.textColor = .systemGray
        
        chatLabel.text = "1234"
        timeLabel.text = "12:33 오전"
    }
}

