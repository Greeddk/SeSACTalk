//
//  UITableViewCell+Extension.swift
//  SeSACTalk
//
//  Created by Greed on 1/14/24.
//

import UIKit

extension UITableViewCell {
    
    func changeTimeDateFormat(date: String) -> String {
        
        let originDateFormat = DateFormatter()
        originDateFormat.dateFormat = "yyyy-MM-dd HH:mm"
        
        guard let origin = originDateFormat.date(from: date) else { return "날짜 오류" }
        
        let chatRoomDateFormat = DateFormatter()
        chatRoomDateFormat.dateFormat = "hh:mm a"
        chatRoomDateFormat.locale = Locale(identifier: "ko_KR")
        
        return chatRoomDateFormat.string(from: origin)
        
    }
    
    func setChatBubbleUI(chatBackView: UIView, chatLabel: UILabel, timeLabel: UILabel) {
        
        chatBackView.layer.cornerRadius = 8
        chatBackView.layer.borderWidth = 1
        chatBackView.layer.borderColor = UIColor.systemGray.cgColor
        
        chatLabel.clipsToBounds = true
        chatLabel.textColor = .black
        chatLabel.numberOfLines = 0
        chatLabel.font = .systemFont(ofSize: 14)

        timeLabel.textColor = .gray
        timeLabel.font = .systemFont(ofSize: 10)
        
    }
}
