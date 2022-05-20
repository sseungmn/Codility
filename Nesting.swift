import Foundation
import Glibc

public func solution(_ S : inout String) -> Int {
    var stack = [Character]()
    for char in S {
        if char == "(" {
            stack.append(char)
        } else {
            if stack.isEmpty { return 0 }
            stack.popLast()
        }
    }
    return stack.isEmpty ? 1 : 0
}
