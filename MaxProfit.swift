import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var minValue = 200000 // 원소의 최댓값
    var maxProfit = 0
    for a in A {
        // 현재까지의 원소 중 가장 작은 값을 저장한다.
        minValue = min(a, minValue)
        // 현재까지의 가장 작은 차잇값과, 현재 값 - 현재까지 가장 작은 값을 비교해 작은 값을 저장한다.
        maxProfit = max(maxProfit, a - minValue)
    }
    return maxProfit
}
