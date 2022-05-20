import Foundation
import Glibc

public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
    // 상류로 향하는 물고기 : 상류물고기(0s) - default
    // 하류로 향하는 물고기 : 하류물고기(1s)
    var ret = 0
    var downstreamStack = [Int]() // 하류 물고기의 size를 저장한다.

    for index in A.indices {
        var alive = true
        if B[index] == 0 { // 현재 상류 물고기일 때
            let upstreamFish = A[index]
            while let downstreamFish = downstreamStack.last {
                if downstreamFish < upstreamFish {
                    // 상류 물고기가 더 크다면, 하류 물고기스택이 빌 때까지 비교한다.
                    downstreamStack.popLast()
                } else {
                    // 상류 물고기가 더 작다면, 잡아먹힌다.
                    alive = false
                    break
                }
            }
            if alive { ret += 1 } // 상류 물고기가 살아남았다면, 개수를 추가 해준다.
        } else { // 하류 물고기일 때
            downstreamStack.append(A[index])
        }
    }
    ret += downstreamStack.count // 살아남은 하류 물고기의 수를 더해준다.
    return ret
}
