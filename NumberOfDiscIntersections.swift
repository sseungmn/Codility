import Foundation
import Glibc

typealias DiscRange = (Int, Int)

public func solution(_ A : inout [Int]) -> Int {
    var pairArr = [DiscRange]()
    for (center, radius) in A.enumerated() {
        pairArr.append((center - radius, center + radius))
    }
    pairArr.sort(by: { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 })

    var count = 0
    for (index, (_, right)) in pairArr.enumerated() {
        let cur = max(0, upperBound(pairArr, right) - index - 1)
        count += cur
        if count > 10000000 { return -1 }
    }
    return count
}

func upperBound(_ arr: [DiscRange], _ target: Int) -> Int {
  var start = 0
  var end = arr.count

  while start < end {
    let mid = (start + end) / 2
    if arr[mid].0 <= target {
      start = mid + 1
    } else {
      end = mid
    }
  }
  return start
}
