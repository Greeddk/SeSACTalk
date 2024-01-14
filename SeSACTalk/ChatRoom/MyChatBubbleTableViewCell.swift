//
//  MyChatBubbleTableViewCell.swift
//  SeSACTalk
//
//  Created by Greed on 1/14/24.
//

import UIKit

class MyChatBubbleTableViewCell: UITableViewCell {
    
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var chatBackView: UIView!
    @IBOutlet var timeLabel: UILabel!
    
    static var identifier = "MyChatBubbleTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        
        setChatBubbleUI(chatBackView: chatBackView, chatLabel: chatLabel, timeLabel: timeLabel)
    }
    
}

extension MyChatBubbleTableViewCell {
    
    func configureMyChatBubble(item: Chat) {
        
        chatLabel.text = item.message
        timeLabel.text = changeTimeDateFormat(date: item.date)
        
        chatBackView.backgroundColor = .systemGray5
    }

}

