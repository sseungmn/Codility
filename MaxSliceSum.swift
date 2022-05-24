import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
  var maxEnding = -1000000 // 원소의 최소 범위
  var maxSlice = -1000000 // 원소의 최소 범위
  for a in A {
    // (현재 원소)와 (현재까지의 가장 큰 합에 현재 원소를 합)한 결과를 비교한다.
    maxEnding = max(a, maxEnding + a)
    // (현재 원소를 기준으로 한 최대 합과)과 (현재까지의 가장 큰 합)과 비교한다.
    maxSlice = max(maxSlice, maxEnding)
  }
  return maxSlice
}
