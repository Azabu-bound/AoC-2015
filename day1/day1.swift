import Foundation

var fileData: String = ""

if let data = try? String(contentsOfFile: "input.txt", encoding: .utf8) {
  fileData = data
}

var floor = 0
var index = 0
for parenthese: Character in fileData {
  index += 1
  if parenthese == "(" {
    floor += 1
  } else if parenthese == ")" {
    floor -= 1
  }
  if floor == -1 { break }
}

print(floor)
print(index)
