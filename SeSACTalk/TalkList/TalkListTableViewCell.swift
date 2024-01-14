//
//  TalkListTableViewCell.swift
//  SeSACTalk
//
//  Created by Greed on 1/14/24.
//

import UIKit

class TalkListTableViewCell: UITableViewCell {
    
    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var chatRoomNameLabel: UILabel!
    @IBOutlet var lastChatLabel: UILabel!
    @IBOutlet var dataLabel: UILabel!
    
    static var identifier = "TalkListTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
    }

    
}

extension TalkListTableViewCell {
    
    func setUI() {
        
        DispatchQueue.main.async {
            self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
        }
        
        
        chatRoomNameLabel.textColor = .black
        
        lastChatLabel.textColor = .systemGray
        
        dataLabel.textColor = .systemGray2
    }
    
    func configureTalkCell(item: ChatRoom) {
        
        profileImageView.image = UIImage(named: item.chatroomImage[0])
        chatRoomNameLabel.text = item.chatroomName
        lastChatLabel.text = item.chatList.last?.message
        dataLabel.text = item.chatList.last?.date
    }
}
