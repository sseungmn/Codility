import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
  // 배열을 순회하며 이전과 같은 원소가 나오면 size + 1
  // 다른 원소가 나오면 해당 원소쌍을 지운다 생각하고 size - 1
  // size가 0일 때, 해당 원소값과 index를 저장한다.
  // 마지막까지 살아남은 원소값이 배열 A에서 차지하는 비중이 과반을 넘으면,
  // 해당 원소의 index를, 아니면 -1을 리턴한다.
  var size = 0
  var value = 0
  var candidate = -1
  for (index, elem) in A.enumerated() {
    if size == 0 {
      size += 1
      value = elem
      candidate = index
    } else {
      if value == elem { size += 1 }
      else { size -= 1 }
    }
  }
  guard size != 0 else { return -1 }
  return A.filter { $0 == value }.count > A.count / 2 ? candidate : -1
}
