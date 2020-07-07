//
//  ViewController.swift
//  Rikimaru_Example
//
//  Created by stefanie on 2020/7/6.
//  Copyright © 2020 stefanie. All rights reserved.
//

import UIKit
import Rikimaru

class ViewController: UIViewController {
  
  let view1 = View1()
  let view2 = View2()
  let view3 = View3()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    view.addSubview(view1)
    view.addSubview(view2)
    view2.addSubview(view3)
    
    register("event1") { parmas in
      print("view-event1 - \(parmas)")
    }
    
    register("event2") { parmas in
      print("view-event2 - \(parmas)")
    }
    
    register("event3") { parmas in
      print("view-event3 - \(parmas)")
    }
    
    /// Register
    view.register("event1") { (parmas) in
      print("event1 - \(parmas)")
    }
    
    view1.register("event1") { (parmas) in
      print("event1 - \(parmas)")
    }

    view1.register("event2") { (parmas) in
      print("event1 - \(parmas)")
    }

    view1.register("event3") { (parmas) in
      print("event1 - \(parmas)")
    }
    
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    view1.frame = view.bounds
    view2.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
    view3.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
  }

}

class View1: UIView {
  
  init() {
    super.init(frame: .zero)
    backgroundColor = .white
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    
    resolve("event1", parameters: ["hello", "world", 1])
  }
  
}

class View2: UIView {
  
  init() {
    super.init(frame: .zero)
    backgroundColor = .green
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    
    resolve("event2", parameters: ["hello", "world", 1])
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
  }
  
}

class View3: UIView {
  
  init() {
    super.init(frame: .zero)
    backgroundColor = .orange
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    
    resolve("event3", parameters: ["hello", "world", 1])
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
  }
  
}
