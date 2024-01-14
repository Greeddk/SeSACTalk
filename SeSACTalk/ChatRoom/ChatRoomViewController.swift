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
    
    static let identifier = "ChatRoomViewController"
    
    var chatRoom: ChatRoom = ChatRoom(chatroomId: 0, chatroomImage: [User.hue.profileImage], chatroomName: User.hue.rawValue)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        configureTableView()
        setNavigationBar()
    }

}

extension ChatRoomViewController { //UI
    
    func setUI() {
        
        topLineView.backgroundColor = .systemGray4
    }
    
    func configureTableView() {
        
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        let xib = UINib(nibName: MyChatBubbleTableViewCell.identifier, bundle: nil)
        chatTableView.register(xib, forCellReuseIdentifier: MyChatBubbleTableViewCell.identifier)
        
        chatTableView.rowHeight = UITableView.automaticDimension
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MyChatBubbleTableViewCell.identifier, for: indexPath) as! MyChatBubbleTableViewCell
        
        return cell
    }
    
}
