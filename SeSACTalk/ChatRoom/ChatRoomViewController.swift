//
//  ChatRoomViewController.swift
//  SeSACTalk
//
//  Created by Greed on 1/14/24.
//

import UIKit

class ChatRoomViewController: UIViewController {
    
    @IBOutlet var topLineView: UIView!
    @IBOutlet var chatTableView: UITableView!
    
    @IBOutlet var textFieldBackView: UIView!
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    
    static let identifier = "ChatRoomViewController"
    
    var chatRoom: ChatRoom = ChatRoom(chatroomId: 0, chatroomImage: [User.hue.profileImage], chatroomName: User.hue.rawValue)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        configureTableView()
        setNavigationBar()
    }

    @IBAction func sendButtonClicked(_ sender: UIButton) {
    }
    
}

extension ChatRoomViewController { //UI
    
    func setUI() {
        
        topLineView.backgroundColor = .systemGray4
        
        userTextField.borderStyle = .none
        userTextField.placeholder = "메세지를 입력하세요"
        
        textFieldBackView.backgroundColor = .systemGray6
        textFieldBackView.layer.cornerRadius = 8
        
        sendButton.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        sendButton.tintColor = .systemGray4
        sendButton.setTitle("", for: .normal)
        
    }
    
    func configureTableView() {
        
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        chatTableView.separatorStyle = .none
        chatTableView.allowsSelection = false
        
        let xib = UINib(nibName: MyChatBubbleTableViewCell.identifier, bundle: nil)
        chatTableView.register(xib, forCellReuseIdentifier: MyChatBubbleTableViewCell.identifier)
        
        let xibPartner = UINib(nibName: PartnerChatBubbleTableViewCell.identifier, bundle: nil)
        chatTableView.register(xibPartner, forCellReuseIdentifier: PartnerChatBubbleTableViewCell.identifier)
        
        chatTableView.rowHeight = UITableView.automaticDimension
        
        //채팅방 제일 최신 쳇 위치로
        //dispatchQueue덕에 굳이 맨 뒤에 적을 필요 없음!
        DispatchQueue.main.async {
            let index = IndexPath(row: self.chatRoom.chatList.count - 1, section: 0)
            self.chatTableView.scrollToRow(at: index, at: .bottom, animated: false)
        }
    }

}

extension ChatRoomViewController { //NavigationBar
    
    func setNavigationBar() {
        
        configureBackButton()
        
        navigationItem.title = chatRoom.chatroomName
        
        navigationItem.hidesBackButton = true
        
    }
    
    func configureBackButton() {
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonClicked))
        backButton.tintColor = .black
        
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }

}

extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatRoom.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let chat = chatRoom.chatList[indexPath.row]
        
        if chat.user == .user {
            let userCell = tableView.dequeueReusableCell(withIdentifier: MyChatBubbleTableViewCell.identifier, for: indexPath) as! MyChatBubbleTableViewCell
            
            userCell.configureMyChatBubble(item: chat)
            
            return userCell
        } else {
            let partnerCell = tableView.dequeueReusableCell(withIdentifier: PartnerChatBubbleTableViewCell.identifier, for: indexPath) as! PartnerChatBubbleTableViewCell
            
            partnerCell.configurePartnerChatBubble(item: chat)
            
            return partnerCell
        }

    }
    
}
