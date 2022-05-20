import Foundation
import Glibc

public func solution(_ H : inout [Int]) -> Int {
  var arraySliceH = ArraySlice(H)
  return minBlocks(&arraySliceH)
}

func minBlocks(_ array: inout ArraySlice<Int>) -> Int {
  var i = array.startIndex
  var count = 0
  while i < array.endIndex {
    let cur = array[i]
    array[i] = 0
    if cur == 0 {
      i += 1
      continue
    }
    var j = i + 1
    while true {
      if !(j < array.endIndex && cur <= array[j]) {
        // 공통 블럭 구성이 종료된다.
        count += 1 // 공통 블럭
        count += minBlocks(&array[i..<j]) // 공통 블럭 위에 새로 만들어질 블럭의 개수
        break
      }
      array[j] -= cur
      j += 1
    }
    i = j
  }
  return count
}
