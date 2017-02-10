import Foundation

extension String {
    var entropy: Double {
        get {
            let containsLowercaseLetters = rangeOfCharacter(from: CharacterSet.lowercaseLetters) != nil
            let containsUppercaseLetters = rangeOfCharacter(from:CharacterSet.uppercaseLetters) != nil
            let containsNumbers = rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
            let containsPunctuation = rangeOfCharacter(from: CharacterSet.punctuationCharacters) != nil

            var possibleCombinations = 0
            
            if containsLowercaseLetters {
                possibleCombinations += 26
            }
            if containsUppercaseLetters {
                possibleCombinations += 26
            }
            if containsNumbers {
                possibleCombinations += 10
            }
            if containsPunctuation {
                possibleCombinations += 32
            }
            
            let jesus = pow(Double(possibleCombinations), Double(self.characters.count))
            let value = log2(jesus)
            
            return value
            }
        }
    }
