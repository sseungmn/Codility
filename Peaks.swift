import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    let N = A.count
    if N < 3 { return 0 }

    let peaks = Array(1..<N-1).filter { A[$0] > max(A[$0 - 1], A[$0 + 1]) }
    // 배열의 길이 N의 약수를 저장한다.
    let components = Array((1...N).reversed()).filter { N % $0 == 0 }

    var ret = 0
    // 큰 약수부터 하나씩 순회한다.
    for component in components {
        // peak를 약수로 나눈 나머지를 중복 없이 저장했을 때,
        // 그 개수가 N / 약수와 같아야 한다.
        // 1, 2, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2일 때, peak = 3, 5, 10이다.
        //                     3, 5, 10
        // component = 6(2) -> 0, 0, 1 -> Set(0, 1) -> 2(==2)개
        // component = 4(3) -> 0, 1, 2 -> Set(0, 1, 2) -> 3(==3)개
        // component = 3(4) -> 1, 1, 3 -> Set(1, 3) -> 2(!=4)
        // 따라서 최대 개수는 3개이다.
        if Set(peaks.map { $0 / component }).count == N / component {
            ret = N / component
        }
    }
    return ret
}
