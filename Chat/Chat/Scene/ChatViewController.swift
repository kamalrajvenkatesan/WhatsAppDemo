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

public class ChatViewController: UIViewController {

  var tableView: UITableView? // Table view that contains chat

  var viewModel: [CellConfigurator] = []

  override public func viewDidLoad() {
        super.viewDidLoad()

      // Navigation bar setup
      self.navigationController?.navigationBar.prefersLargeTitles = false

      if let json = loadJson(type: [Message].self, fileName: "ChatOne") {
        viewModel = json.map { chatTextCellConfig.init(item: $0) }
      }

      // Table View
      tableView = UITableView(frame: self.view.frame)
      tableView?.dataSource = self
      tableView?.register(TextCell.self, forCellReuseIdentifier: "TextCell")
      tableView?.separatorStyle = .none
      self.view.addSubview(tableView!)

    }

  override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
