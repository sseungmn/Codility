import Foundation
import Glibc

public func solution(_ N : Int, _ M : Int) -> Int {
    let lcm = N * M / gcd(N, M)
    return lcm / M
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if a == b || b == 0 {
        return a
    } else if a < b {
        return gcd(a, b % a)
    }
    return gcd(b, a % b)
}
