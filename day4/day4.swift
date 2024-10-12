import CryptoKit

func findLowestNumber(secretKey: String) -> Int {
  var number = 1

  while true {
    let input = secretKey + String(number)

    // compute MD5 hash
    let digest = Insecure.MD5.hash(data: input.data(using: .utf8)!)
    let md5String = digest.map { String(format: "%02hhx", $0) }.joined()

    // check if the hash begins with 6 zeros
    if md5String.hasPrefix("000000") { return number }
    number += 1
  }
}

let secretKey = "ckczppom"
let result = findLowestNumber(secretKey: secretKey)
print("The lowest number is: \(result)")
