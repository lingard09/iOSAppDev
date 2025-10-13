import UIKit

func sumOfNum(str: String) -> (Int){
    var digits = str.count - 1
    var num = Int(str)!
    var sum = 0
    var mod = 0
    for i in (0...digits).reversed() {
        if (i == digits){
            var squ = 1
            for j in (1...digits).reversed() {
                squ *= 10
            }
            sum += num / squ
            mod = num % squ
        }
        else {
            var squ = 1
            for j in (0...i).reversed() {
                if(j != 0){
                    squ *= 10
                }
            }
            sum += mod / squ
            mod = mod % squ
        }
    }
    return sum
}
print("Q1================")
print(sumOfNum(str: "2514"))

func Str2Int(str: String) -> Int {
    var result = 0
    var power = str.count - 1

    for c in str {
        var digit = 0
        if c == "1" {
            digit = 1
        }
        else if c == "2" {
            digit = 2
        }
        else if c == "3" {
            digit = 3
        }
        else if c == "4" {
            digit = 4
        }
        else if c == "5" {
            digit = 5
        }
        else if c == "6" {
            digit = 6
        }
        else if c == "7" {
            digit = 7
        }
        else if c == "8" {
            digit = 8
        }
        else if c == "9" {
            digit = 9
        }
        
        result += digit * Int(pow(10.0, Double(power)))
        power -= 1
    }
    return result
}

print("\nQ2================")
print(Str2Int(str: "2514"))
print(Str2Int(str: "333"))
print(Str2Int(str: "907"))
print(Str2Int(str: "5"))

func pathSplit(str: String) {
    var slash = str.lastIndex(of: "/")
    if(slash == nil) {
        var file = str
        var dot = file.lastIndex(of: ".")
        if(dot == nil) {
            print("The file name without the extension: "+file)
        }
        else {
            var afterDot = file.index(after: dot!)
            var fileName = file[..<dot!]
            print("The file name without the extension: "+fileName)
            var fileExt = file[afterDot...]
            print("The file extension: "+fileExt)
        }
    } else{
        var afterSlash = str.index(after: slash!)
        var path = str[...slash!]
        print("The path to the file: "+path)
        var file = str[afterSlash..<(str.endIndex)]
        
        var dot = file.lastIndex(of: ".")!
        var afterDot = file.index(after: dot)
        var fileName = file[..<dot]
        print("The file name without the extension: "+fileName)
        var fileExt = file[afterDot...]
        print("The file extension: "+fileExt)
    }
}
print("\nQ3================")
pathSplit(str: "/class/labs/lab0/test.txt")
print()
pathSplit(str: "test.txt")
print()
pathSplit(str: "test")

func middleTwo(str: String) -> (String) {
    var result = ""
    if (str.count >= 2 && str.count % 2 == 0) {
        var midSmallIndex = str.index(str.startIndex, offsetBy: str.count / 2 - 1)
        var midBigIndex = str.index(str.startIndex, offsetBy: str.count / 2 + 1)
        result = String(str[midSmallIndex..<midBigIndex])
    }
    return result
}

print("\nQ4================")
print(middleTwo(str: "barabara"))

func connectWords(word1: String, word2: String) -> (String) {
    var word = word1
    
    if(word1.last == word2.first) {
        word.remove(at: word.index(before: word.endIndex))
        
    }
    word.append(contentsOf: word2)
    return word
}
print("\nQ5================")
print(connectWords(word1: "sher", word2: "lock"))
print(connectWords(word1: "abc", word2: "cde"))

func pigLatin(str: String) -> String {
    var result = ""
    var currentWord = ""
    
    for char in str {
        if char == " " {
            if (currentWord.isEmpty != true) {
                var word = currentWord
                let first = word.remove(at: word.startIndex)
                word.append(first)
                word.append("ay")
                result += word
                currentWord = ""
            }
            result.append(" ")
        } else {
            currentWord.append(char)
        }
    }
    if (currentWord.isEmpty != true) {
        var word = currentWord
        let first = word.remove(at: word.startIndex)
        word.append(first)
        word.append("ay")
        result += word
    }
    return result
}

print("\nQ6================")
print(pigLatin(str: "o"))
print(pigLatin(str: "college"))
print(pigLatin(str: "o o   o"))
print(pigLatin(str: "i am testing out this function"))

