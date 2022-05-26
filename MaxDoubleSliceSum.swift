import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
  let n = A.count
  var maxEnding = [Int](repeating: 0, count: n)
  var maxOpening = [Int](repeating: 0, count: n)
  var maxSlice = 0

  if n < 4 { return 0 }
  for i in 1..<n-1 {
    maxEnding[i] = max(maxEnding[i - 1] + A[i], 0)
  }
  for i in stride(from: n-1, to: 1, by: -1) {
    maxOpening[i - 1] = max(maxOpening[i] + A[i - 1], 0)
  }
  for i in (1..<n-1) {
    maxSlice = max(maxSlice, maxEnding[i-1] + maxOpening[i+1])
  }
  return maxSlice
}
