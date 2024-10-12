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

func parseDimensions(from line: String) -> (Int, Int, Int)? {
  let parts = line.split(separator: "x").compactMap { Int($0) }
  if parts.count == 3 { return (parts[0], parts[1], parts[2]) }
  return nil
}
