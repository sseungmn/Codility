import Foundation
import Glibc

public func solution(_ N : Int) -> Int {
    var count = 0
    var i = 1
    while i * i <= N {
        if N % i == 0 { count = i * i == N ? count + 1 : count + 2 }
        i += 1
    }
    return count
}
