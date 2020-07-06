//
//  RikimaruTests.swift
//  RikimaruTests
//
//  Created by Stefanie on 2020/7/2.
//  Copyright © 2020 Coconut. All rights reserved.
//

import XCTest
import UIKit
@testable import Rikimaru

class RikimaruTests: XCTestCase {
  
  class ViewController: UIViewController {
    
    var touched = false
    
    var parameters: Parameters = []
    
    private let touchedView: UIView = {
      let view = UIView()
      
      return view
    }()
    
    override func viewDidLoad() {
      super.viewDidLoad()
      view.addSubview(touchedView)
      
      register("event") { [weak self] parameters in
        guard let self = self else { return }
        self.parameters = parameters
        self.touched = true
      }
    }
    
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      
      touchedView.resolve("event", parameters: ["hello", "world"])
    }
    
  }
  
  private var window: UIWindow!
  
  private var viewController: ViewController!

  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    viewController = ViewController()
    window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = viewController
    window.makeKeyAndVisible()
  }

  func testViewControllerRegister() {
    viewController.viewDidAppear(false)
    
    XCTAssert(viewController.touched, "testViewControllerRegister event falied")
    XCTAssert((viewController.parameters as! [String]) == ["hello", "world"], "testViewControllerRegister parameters falied")
  }

}
