//
//  UIResponder+Rikimaru.swift
//  Rikimaru
//
//  Created by stefanie on 2020/7/6.
//  Copyright © 2020 Coconut. All rights reserved.
//

import UIKit

private struct AssociatedKey {
  static var handles = "com.rikimaru.responder.actions" + UUID().uuidString
}

extension UIResponder: Rikimaru {
  
  var rikimaru_handles: [Int: Action] {
    get {
      let handles = objc_getAssociatedObject(self, &AssociatedKey.handles) as? [Int: Action]
      return handles ?? [:]
    }
    set {
      objc_setAssociatedObject(self, &AssociatedKey.handles, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
  
  public func register(_ eventName: String, handle: @escaping (Parameters) -> Void) {
    let identity = eventName.rikimaru_identity
    let action = Action(identity, handle: handle)
    rikimaru_handles[identity] = action
  }
    
  public func resolve(_ eventName: String, parameters: Parameters) {
    var responder: UIResponder? = self
    while responder != nil {
      responder?.rikimaru_handles[eventName.rikimaru_identity]?.handle(parameters)
      responder = responder?.next
    }
  }
  
}

private extension String {
  var rikimaru_identity: Int {
    return hashValue
  }
}
