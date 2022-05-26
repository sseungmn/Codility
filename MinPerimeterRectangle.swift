import Foundation
import Glibc

public func solution(_ N : Int) -> Int {
    var i = 1
    var minPerimeter = 2 * (1 + 1000000000)
    while i * i <= N {
        if N % i == 0 {
            minPerimeter = min(minPerimeter, 2 * (i + N / i))
        }
        i += 1
    }
    return minPerimeter
}
