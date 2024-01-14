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
    @IBOutlet var dateLabel: UILabel!
    
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
        chatRoomNameLabel.font = .boldSystemFont(ofSize: 14)
        
        lastChatLabel.textColor = .gray
        lastChatLabel.font = .systemFont(ofSize: 12)
        
        dateLabel.textColor = .systemGray
        dateLabel.font = .systemFont(ofSize: 12)
    }
    
    func configureTalkCell(item: ChatRoom) {
        
        profileImageView.image = UIImage(named: item.chatroomImage[0])
        
        chatRoomNameLabel.text = item.chatroomName
        
        guard let lastChat = item.chatList.last else { return }
        
        lastChatLabel.text = lastChat.message
        
        dateLabel.text = changeDateFormat(date: lastChat.date)
    }
    
    func changeDateFormat(date: String) -> String {
        
        let originFormat = DateFormatter()
        originFormat.dateFormat = "yyyy-MM-dd HH:mm"
        guard let origin = originFormat.date(from: date) else { return "날짜 오류" }
        
        let customFormat = DateFormatter()
        customFormat.dateFormat = "yy.MM.dd"
        
        return customFormat.string(from: origin)
    }
}
