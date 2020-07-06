//
//  Rikimaru.swift
//  Rikimaru
//
//  Created by Stefanie on 2020/7/2.
//  Copyright © 2020 Coconut. All rights reserved.
//

import Foundation

public protocol Rikimaru {
  
  func register(_ eventName: String, handle: @escaping (Parameters) -> Void)
  
  func resolve(_ eventName: String, parameters: Parameters)
  
}
