import Foundation
import Glibc

public func solution(_ S : inout String) -> Int {
    var stack = [Character]()
    let brackets: [Character: Character] = [")": "(", "]": "[", "}": "{"]

    for char in S {
        // 여는 괄호일 때
        if brackets.values.contains(char) {
            stack.append(char)
        // 닫는 괄호일 때
        } else {
            if let top = stack.last,
               top == brackets[char] {
                 stack.popLast()
            } else {
                return 0
            }
        }
    }
    return stack.isEmpty ? 1 : 0
}
