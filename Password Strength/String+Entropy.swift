import Foundation

extension String {
    var entropy: Double {
        get {
            let containsLowercaseLetters = self.rangeOfCharacter(from: CharacterSet.lowercaseLetters) != nil
            let containsUppercaseLetters = self.rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil
            let containsNumbers = self.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
            let containsPunctuation = self.rangeOfCharacter(from: CharacterSet.punctuationCharacters) != nil
            

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

            
            let numberOfCombinations = pow(Double(possibleCombinations), Double(self.characters.count))
            return log2(numberOfCombinations)
        }
    }
    
    var averageEntropy: Double {
        if self.isEmpty {
            return 0
        }
        
        return self.entropy/Double(self.characters.count)
    }
}
