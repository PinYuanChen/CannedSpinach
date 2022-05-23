//
// Created on 2022/5/23.
//

import Foundation

/// Class initialization with settings
infix operator -->

func --><T>(obj: T, closure:(T) -> Void) -> T {
    closure(obj)
    return obj
}
