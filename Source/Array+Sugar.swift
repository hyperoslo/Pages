extension Array {
  
  func at(index: Int?) -> Element? {
    if let index = index where index >= 0 && index < endIndex {
      return self[index]
    } else {
      return nil
    }
  }
}

func nextIndex(x: Int?) -> Int? {
  return x.map { $0 + 1 }
}

func prevIndex(x: Int?) -> Int? {
  return x.map { $0 - 1 }
}
