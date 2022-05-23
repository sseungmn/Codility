import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    let n = A.count
    // 나뉜 두 배열 중 최소 하나는 원본 배열의 leader와 같기 때문에, 원본 배열의 leader을 먼저 구한다.
    var value = 0
    var size = 0
    for elem in A {
        if size == 0 {
            value = elem
            size += 1
        } else {
            if value == elem { size += 1 }
            else { size -= 1 }
        }
    }
    // 문제에서는 별 다른 조건이 없기 때문에 항상 leader가 나온다고 가정한다.
    // 각 index까지의 원소 중 원본 배열의 leader가 몇 번 출현하는지 기록한다.
    var leaderFrequencyCount = [Int](repeating: 0, count: A.count)
    var count = 0
    for (index, elem) in A.enumerated() {
        if elem == value { count += 1 }
        leaderFrequencyCount[index] = count
    }
    // 각 index에서 분리된 배열의 leader 비율을 계산해 두 배열 모두 0.5를 넘기면 count를 추가한다.
    let maxCount = leaderFrequencyCount.last!
    return leaderFrequencyCount
        .enumerated()
        .filter { index, count in
            return 2 * count > (index + 1) && 2 * (maxCount - count) > (n - index - 1)
        }
        .count
}
