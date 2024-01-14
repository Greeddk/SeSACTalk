//
//  ChatRoomViewController.swift
//  SeSACTalk
//
//  Created by Greed on 1/14/24.
//

import UIKit

class ChatRoomViewController: UIViewController {
    
    static let identifier = "ChatRoomViewController"
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    


}

extension ChatRoomViewController { //UI
    
    func setUI() {
        
        topLineView.backgroundColor = .systemGray4
    }

    
}

extension ChatRoomViewController { //NavigationBar
    
    func setNavigationBar() {
        
        configureBackButton()
        
        navigationItem.title = "Den"
        
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
