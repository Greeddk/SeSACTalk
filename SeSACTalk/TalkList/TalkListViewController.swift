//
//  TalkListViewController.swift
//  SeSACTalk
//
//  Created by Greed on 1/14/24.
//

import UIKit

protocol chatListViewProtocol {
    func setUI()
    func setNavigationBar()
}

class TalkListViewController: UIViewController {
    

    @IBOutlet var friendSearchBar: UISearchBar!
    
    @IBOutlet var topLineView: UIView!
    
    @IBOutlet var chatListTableView: UITableView!
    
    var chatList = mockChatList
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        setUI()
        setNavigationBar()
    }

}

extension TalkListViewController: chatListViewProtocol {
    
    func configureTableView() {
        
        chatListTableView.delegate = self
        chatListTableView.dataSource = self
        
        chatListTableView.rowHeight = 75
        
        let xib = UINib(nibName: TalkListTableViewCell.identifier, bundle: nil)
        chatListTableView.register(xib, forCellReuseIdentifier: TalkListTableViewCell.identifier)
        
    }
    
    func setUI() {
        
        topLineView.backgroundColor = .systemGray4
        
        friendSearchBar.placeholder = "친구 이름을 검색해보세요"
        friendSearchBar.searchBarStyle = .minimal
    }
    
    func setNavigationBar() {
        
        navigationItem.title = "SeSAC TALK"
    }
}

extension TalkListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        chatList = mockChatList.filter { chatRoom in
            chatRoom.chatroomImage.contains { imageName in
                imageName.lowercased().contains(searchText.lowercased())
            }
        }
        
        if searchText.isEmpty {
            chatList = mockChatList
        }
        
        chatListTableView.reloadData()
    }
}

extension TalkListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TalkListTableViewCell.identifier, for: indexPath) as! TalkListTableViewCell
        
        cell.configureTalkCell(item: chatList[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: ChatRoomViewController.identifier) as! ChatRoomViewController
        
        vc.chatRoom = chatList[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
        
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
    
}
