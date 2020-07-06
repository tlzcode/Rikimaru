//
//  Action.swift
//  Rikimaru
//
//  Created by Stefanie on 2020/7/3.
//  Copyright © 2020 Coconut. All rights reserved.
//

import Foundation

public struct Action {
  
  public let identity: Int
  
  let handle: (Parameters) -> Void
  
  init(_ identity: Int,
       handle: @escaping (Parameters) -> Void) {
    self.identity = identity
    self.handle = handle
  }
  
}
