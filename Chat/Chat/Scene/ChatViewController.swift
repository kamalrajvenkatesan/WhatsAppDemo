//
//  ChatViewController.swift
//  Chat
//
//  Created by kamalraj venkatesan on 20/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import Foundation
import UIKit
import Shared
import RealmSwift

public class ChatViewController: UIViewController {

  var tableView: UITableView? // Table view that contains chat

  var viewModel: [CellConfigurator] = []

  public var chatId: String?

  var notificationToken: NotificationToken?

  var needToScroll = false

  override public func viewDidLoad() {
        super.viewDidLoad()

      // Hiding Tabbar
      self.tabBarController?.tabBar.isHidden = true

      // Navigation bar setup
      self.navigationController?.navigationBar.prefersLargeTitles = false

      // Fethching chat from db
      let realm = try! Realm()
      if chatId != nil, let chat = realm.object(ofType: ChatListModel.self, forPrimaryKey: chatId!) {
        let message = chat.messages.sorted(byKeyPath: "createdTs", ascending: true)

        notificationToken = realm.observe({ _,_  in
          self.viewModel = message.map{ chatTextCellConfig.init(item: $0) }
          self.tableView?.reloadData()

          // Scrolling to bottom
          if self.viewModel.count > 1 {
            self.scrollToBottom()
          }
        })

        // User info setup
        self.navigationItem.titleView = UserInfoView.init(userImage: chat.userImage, name: chat.userName, frame: CGRect(x: 0, y: 0, width: self.view.bounds.width - 50, height: 44))

        // Listing Chat messages
        self.viewModel = message.map{ chatTextCellConfig.init(item: $0) }
        self.tableView?.reloadData()
      }


      // Table View
      tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 50))
      tableView?.dataSource = self
      tableView?.register(TextCell.self, forCellReuseIdentifier: "TextCell")
      tableView?.separatorStyle = .none
      tableView?.backgroundColor = #colorLiteral(red: 0.7490000129, green: 0.8159999847, blue: 0.9139999747, alpha: 1)
      self.view.addSubview(tableView!)

      self.needToScroll = true

      //
      let sendMessageView = SendMessageView(frame: CGRect(x: 0, y: tableView!.frame.height, width: self.view.frame.width, height: 50))
      sendMessageView.delegate = self
      self.view.addSubview(sendMessageView)
    }

  override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    // Hiding Tabbar
    self.tabBarController?.tabBar.isHidden = true
  }

  public override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    if (self.needToScroll) {
      self.scrollToBottom()
      self.needToScroll = false
    }

  }

    public override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)

      // Unhiding Tabbar
      self.tabBarController?.tabBar.isHidden = false
    }

  private func scrollToBottom() {
    guard self.tableView != nil, self.tableView!.numberOfRows(inSection: 0) > 1 else {
      // Table view not available
      return
    }
    self.tableView!.scrollToRow(at: IndexPath(row: self.tableView!.numberOfRows(inSection: 0) - 1, section: 0), at: .bottom, animated: false)
  }


}

extension ChatViewController: SendMessageDelegate {
  func sendNewMessage(text: String?) {
    guard text != nil && text != "" else {
      // Text is empty
      let alert = UIAlertController(title: "Empty!!!", message: "Enter something to send a message!", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
      present(alert, animated: true)
      return
    }

    let realm = try! Realm()
    if self.chatId != nil, let chat = realm.object(ofType: ChatListModel.self, forPrimaryKey: self.chatId!) {
      let messageModel = MessageModel()
      messageModel._id = UUID.init().uuidString
      messageModel.message = text!
      messageModel.chatId = self.chatId!
      messageModel.isSent = true
      let currentTimeDate = Date()
      messageModel.date = currentTimeDate.getDate()
      messageModel.time = currentTimeDate.getTime()
      
      try! Realm().write {
        chat.messages.append(messageModel)
      }
    }
  }
}

extension ChatViewController: UITableViewDataSource {

  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.count
  }

  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let data = viewModel[indexPath.row]

    let cell = tableView.dequeueReusableCell(withIdentifier: type(of: data).reuseId, for: indexPath)
    data.configure(cell: cell)
    return cell
  }

}
