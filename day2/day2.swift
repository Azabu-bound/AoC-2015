import Foundation

func wrappingPaperRequired(for dimensions: (Int, Int, Int)) -> Int {
  let (l, w, h) = dimensions

  // Calc the surface area
  let surfaceArea = 2 * l * w + 2 * w * h + 2 * l * h

  let side1 = l * w
  let side2 = w * h
  let side3 = l * h

  // Smallest side
  let slack = min(side1, side2, side3)

  // Total amount of wrapping paper required
  return slack + surfaceArea
}

func ribbonRequired(for dimensions: (Int, Int, Int)) -> Int {
  let (l, w, h) = dimensions

  // Calculate the perimeter of each side
  let perimeter1 = 2 * (l + w)
  let perimeter2 = 2 * (w + h)
  let perimeter3 = 2 * (h + l)

  // Find the smallest perimeter
  let smallestPerimeter = min(perimeter1, perimeter2, perimeter3)

  let bow = l * w * h

  return smallestPerimeter + bow
}

func parseDimensions(from line: String) -> (Int, Int, Int)? {
  let parts = line.split(separator: "x").compactMap { Int($0) }
  if parts.count == 3 { return (parts[0], parts[1], parts[2]) }
  return nil
}

let filePath = "input.txt"

do {
  let fileContent = try String(contentsOfFile: filePath, encoding: .utf8)
  let lines = fileContent.components(separatedBy: "\n").filter { !$0.isEmpty }
  var totalWrappingPaper = 0
  var totalRibbon = 0

  for line in lines {
    if let dimensions = parseDimensions(from: line) {
      totalWrappingPaper += wrappingPaperRequired(for: dimensions)
      totalRibbon += ribbonRequired(for: dimensions)
    }
  }

  print("Total wrapping paper required: \(totalWrappingPaper)")
  print("Total ribbon required: \(totalRibbon)")

} catch {
  print("Error reading the file: \(error)")
}
