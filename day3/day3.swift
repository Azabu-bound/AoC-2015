import Foundation

struct Coordinate: Hashable {
  var x: Int
  var y: Int
}

// helper function
func move(_ direction: Character, position: inout Coordinate) {
  switch direction {
  case "^": position.y += 1
  case "v": position.y -= 1
  case ">": position.x += 1
  case "<": position.x -= 1
  default: break
  }
}

func uniqueHousesVisited(from filePath: String) -> Int? {
  // Read the input file
  guard let fileContent = try? String(contentsOfFile: filePath, encoding: .utf8) else {
    print("Error reading the file")
    return nil
  }

  // use a set to track houses visited
  var visitedHouses: Set<(Coordinate)> = [Coordinate(x: 0, y: 0)]

  // starting positon for Santa
  var santaPosition = Coordinate(x: 0, y: 0)

  // startign positon for Robo-Santa
  var roboPosition = Coordinate(x: 0, y: 0)

  // iterate through each direction
  for (index, direction) in fileContent.enumerated() {
    if index % 2 == 0 {
      move(direction, position: &santaPosition)
      visitedHouses.insert(santaPosition)
    } else {
      move(direction, position: &roboPosition)
      visitedHouses.insert(roboPosition)
    }
  }

  // return unique number of houses visited
  return visitedHouses.count
}

let filePath = "input.txt"
if let result = uniqueHousesVisited(from: filePath) {
  print("Number of unique houses visited: \(result)")
}
