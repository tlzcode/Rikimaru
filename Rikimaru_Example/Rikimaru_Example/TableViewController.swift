//
//  TableViewController.swift
//  Rikimaru_Example
//
//  Created by stefanie on 2020/7/6.
//  Copyright © 2020 stefanie. All rights reserved.
//

import UIKit
import Rikimaru

class TableViewController: UITableViewController {
  
  struct Example {
    
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.register(ExampleCell.self, forCellReuseIdentifier: "ExampleCell")
    registerRikimaru()
  }
  
  private func registerRikimaru() {
    register("example-view-button-tapped") { parmas in
      print(parmas)
    }
    register("example-cell-button-tapped") { parmas in
      print(parmas)
    }
  }

  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ExampleCell")
    return cell!
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }

}

final class ExampleCell: UITableViewCell {
  
  private lazy var button: UIButton = {
    let button = UIButton(type: .system)
    button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    button.setTitle("tap", for: .normal)
    button.backgroundColor = .orange
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  private let exampleView: ExampleView = {
    let view = ExampleView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    contentView.addSubview(button)
    contentView.addSubview(exampleView)
    NSLayoutConstraint.activate([
      button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 100),
      button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      button.widthAnchor.constraint(equalToConstant: 100),
      button.heightAnchor.constraint(equalToConstant: 30),
      
      exampleView.leadingAnchor.constraint(equalTo: button.trailingAnchor, constant: 30),
      exampleView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
      exampleView.widthAnchor.constraint(equalToConstant: 40),
      exampleView.heightAnchor.constraint(equalToConstant: 40)
    ])
  }
  
  @objc private func buttonTapped(_ sendet: UIButton) {
    resolve("example-cell-button-tapped", parameters: ["what's", "your", "name"])
  }
  
}

final class ExampleView: UIView {
  
  private lazy var button: UIButton = {
    let button = UIButton(type: .system)
    button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    button.setTitle("tap", for: .normal)
    button.backgroundColor = .green
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    addSubview(button)
    
    NSLayoutConstraint.activate([
      button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      button.centerYAnchor.constraint(equalTo: centerYAnchor),
      button.widthAnchor.constraint(equalToConstant: 30),
      button.heightAnchor.constraint(equalToConstant: 30)
    ])
  }
  
  @objc private func buttonTapped(_ sendet: UIButton) {
    resolve("example-view-button-tapped", parameters: ["hello", "world", 1])
  }
  
}
