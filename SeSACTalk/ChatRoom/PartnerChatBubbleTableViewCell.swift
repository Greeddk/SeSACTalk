//
//  PartnerChatBubbleTableViewCell.swift
//  SeSACTalk
//
//  Created by Greed on 1/14/24.
//

import UIKit

class PartnerChatBubbleTableViewCell: UITableViewCell {
    
    
    @IBOutlet var partnerImageView: UIImageView!
    @IBOutlet var partnerNameLabel: UILabel!
    @IBOutlet var chatBackView: UIView!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    static var identifier = "PartnerChatBubbleTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setChatBubbleUI(chatBackView: chatBackView, chatLabel: chatLabel, timeLabel: timeLabel)
    }
    
}

extension PartnerChatBubbleTableViewCell {
    
    func configurePartnerChatBubble(item: Chat) {
        
        partnerImageView.image = UIImage(named: item.user.profileImage)
        partnerNameLabel.text = item.user.rawValue
        partnerNameLabel.font = .systemFont(ofSize: 12)
        
        chatLabel.text = item.message
        timeLabel.text = changeTimeDateFormat(date: item.date)
    }
}
