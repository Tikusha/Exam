
//Task #1
//დაწერეთ ფუნქცია, რომელსაც გადაეცემა ტექსტი  და აბრუნებს პალინდრომია თუ არა. (პალინდრომი არის ტექსტი რომელიც ერთნაირად იკითხება ორივე მხრიდან).
//Boolean isPalindrome(String text);

func textReverse(_ text: String) -> String {
    String(text.reversed())
}

func isPalindrome(_ text: String) -> Bool {
    text == textReverse(text) ? true : false
}

isPalindrome("TIKO")
isPalindrome("ABCCBA")

//Task #2
//გვაქვს 1,5,10,20 და 50 თეთრიანი მონეტები. დაწერეთ ფუნქცია, რომელსაც გადაეცემა თანხა (თეთრებში) და აბრუნებს მონეტების მინიმალურ რაოდენობას, რომლითაც შეგვიძლია ეს თანხა დავახურდაოთ.
//Int minSplit(Int amount);

//მეორე ამოცანა დაწერილია c#-ზე

//static void minSplit(int amount) {
//    List<int> result = new List<int>();
//    for(int i = n - 1; i >= 0; i--) {
//        while (amount >= deno[i]) {
//            amount -= deno[i];
//            result.Add(deno[i]);
//        }
//    }
//    Console.Write(result.Count);
//}
//
//minSplit(10)



//Task #3
//მოცემულია მასივი, რომელიც შედგება მთელი რიცხვებისგან. დაწერეთ ფუნქცია რომელსაც გადაეცემა ეს მასივი და აბრუნებს მინიმალურ მთელ რიცხვს, რომელიც 0-ზე მეტია და ამ მასივში არ შედის.
//Int notContains(Int[] array);

func notContains(_ array: [Int]) -> Int {
    guard let max = array.max(), max > 0 else { return 1 }
    let count = array.count
    
    var temp = Array(repeating: 0, count: max + 1)
    
    for j in (0..<count) {
        let value = array[j]
        if value > 0 {
            temp[value] = -1
        }
    }
    
    for i in (1...max) {
        if temp[i] == 0 {
            return i
        }
    }
    return max + 1
}

notContains([3,5,-3,-2])
notContains([3, 4, -1, 1,2])


//Task #4
//მოცემულია String რომელიც შედგება „(„ და „)“ ელემენტებისგან. დაწერეთ ფუნქცია რომელიც აბრუნებს ფრჩხილები არის თუ არა მათემატიკურად სწორად დასმული.
//Boolean isProperly(String sequence);
//მაგ: (()()) სწორი მიმდევრობაა,  ())() არასწორია

func isProperly(_ sequence: String) -> Bool {
    var isBalanced = true
    
    var char = [Character]()
    
    for i in sequence {
        if i == "(" || i == "[" || i == "{" {
            char.append(i)
        }
        else {
            if char.count > 0 {
                let temp = char[char.count - 1]
                char.popLast()
                if i == "(" && temp != ")" {
                    isBalanced = false
                    break
                }
                if i == "[" && temp != "]" {
                    isBalanced = false
                    break
                }
                if i == "{" && temp != "}" {
                    isBalanced = false
                    break
                }
            } else {
                isBalanced = false
                break
            }
        }
    }
    
    if char.count > 0 {
        isBalanced = false
    }
    
    if isBalanced {
        return true
    } else {
        return false
    }
}

isProperly("(„და „)")
isProperly("(){}[]")


//Task #5
//გვაქვს n სართულიანი კიბე, ერთ მოქმედებაში შეგვიძლია ავიდეთ 1 ან 2 საფეხურით. დაწერეთ ფუნქცია რომელიც დაითვლის n სართულზე ასვლის ვარიანტების რაოდენობას.
//Int countVariants(Int stearsCount);

func countVariants(_ n: Int) -> Int {
    if (n == 1 || n == 0) {
        return 1
    } else if (n == 2) {
        return 2
    } else {
        return countVariants(n - 3) + countVariants(n - 2)
            + countVariants(n - 1)
    }
}

let v = countVariants(5)



//Task 6
//დაწერეთ საკუთარი მონაცემთა სტრუქტურა, რომელიც საშუალებას მოგვცემს O(1) დროში წავშალოთ ელემენტი.

struct Names {
    var array: [String] = ["Tiko", "Ana", "Nino"]
    
    mutating func remote(at i: Int) {
        self.array.remove(at: i)
    }
}

var names = Names()
names.remote(at: 1)
print(names)

// სხვა ვარიანტი
struct Data<Element: Equatable>: Equatable {
    var array: [Element] = []
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    mutating func pop() -> Element? {
        self.array.popLast()
    }
}

var cars = Data<String>()

cars.push("SUZUKI")
cars.push("BMW")
cars.push("TOYOTA")
cars.pop()
print(cars)




