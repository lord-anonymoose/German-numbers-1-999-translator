import SwiftUI
import Combine

var errorCode = 0 //Код ошибки
var errorMember = -1 //Номер слова с ошибкой
var hundertFound: Bool = false
var undFound: Bool = false
var found10: Bool = false
var wrongWord1: String = ""
var wrongWord2: String = ""

func clearVariables ()
{
    errorCode = 0;
    errorMember = -1
    hundertFound = false
    undFound = false
    found10 = false
    wrongWord1 = ""
    wrongWord1 = ""
}

func randomEmoji() -> String { 
        let range = ["🙃","🤨","😒","😞","😔","😟","😕","🙁","☹️","😣","😖","😫","😩","🥺","😢","😭","😤","😠","🤯","😳","😱","😨","😰","😥","😓","🤔","🤭","😶","😐","😑","😯","😦","😧","😮","🥱","😴","🤤","😪","😵","🤐"]
        return range.randomElement() ?? "😕"
    }

func ConvertOneNumber(with OneString: String) -> Int
{
    var result: Int = -1;
    if OneString == "eins" {result = 1}
    if OneString == "ein" {result = 1}
    if OneString == "zwei" {result = 2}
    if OneString == "drei" {result = 3}
    if OneString == "vier" {result = 4}
    if OneString == "funf" {result = 5}
    if OneString == "fuenf" {result = 5}
    if OneString == "fünf" {result = 5}
    if OneString == "sechs" {result = 6}
    if OneString == "sieben" {result = 7}
    if OneString == "acht" {result = 8}
    if OneString == "neun" {result = 9}
    if OneString == "zehn" {result = 10}
    if OneString == "elf" {result = 11}
    if OneString == "zwolf" {result = 12}
    if OneString == "zwoelf" {result = 12}
    if OneString == "zwölf" {result = 12}
    if OneString == "dreizehn" {result = 13}
    if OneString == "vierzehn" {result = 14}
    if OneString == "funfzehn" {result = 15}
    if OneString == "fünfzehn" {result = 15}
    if OneString == "funfzehn" {result = 15}
    if OneString == "sechszehn" {result = 16}
    if OneString == "siebzehn" {result = 17}
    if OneString == "achtzehn" {result = 18}
    if OneString == "neunzehn" {result = 19}
    if OneString == "zwanzig" {result = 20}
    if OneString == "dreissig" {result = 30}
    if OneString == "dreissig" {result = 30}
    if OneString == "vierzig" {result = 40}
    if OneString == "funfzig" {result = 50}
    if OneString == "fuenfzig" {result = 50}
    if OneString == "fünfzig" {result = 50}
    if OneString == "sechzig" {result = 60}
    if OneString == "siebzig" {result = 70}
    if OneString == "achtzig" {result = 80}
    if OneString == "neunzig" {result = 90}
    return result;
}

func ConvertToRoman (with myLine: String) -> String
{
    var myNumber: Int = Int(myLine) ?? 0
    var resultLine = ""
    var digit1: Int
    var digit2: Int
    var digit3: Int
    digit3 = myNumber % 10
    myNumber = (myNumber - digit3)/10
    digit2 = myNumber % 10
    myNumber = (myNumber - digit2)/10
    digit1 = myNumber
    if (digit1 == 1) {resultLine = resultLine + "C"}
    if (digit1 == 2) {resultLine = resultLine + "CC"}
    if (digit1 == 3) {resultLine = resultLine + "CCC"}
    if (digit1 == 4) {resultLine = resultLine + "CD"}
    if (digit1 == 5) {resultLine = resultLine + "D"}
    if (digit1 == 6) {resultLine = resultLine + "DC"}
    if (digit1 == 7) {resultLine = resultLine + "DCC"}
    if (digit1 == 8) {resultLine = resultLine + "DCCC"}
    if (digit1 == 9) {resultLine = resultLine + "CM"}
    if (digit2 == 1) {resultLine = resultLine + "X"}
    if (digit2 == 2) {resultLine = resultLine + "XX"}
    if (digit2 == 3) {resultLine = resultLine + "XXX"}
    if (digit2 == 4) {resultLine = resultLine + "XL"}
    if (digit2 == 5) {resultLine = resultLine + "L"}
    if (digit2 == 6) {resultLine = resultLine + "LX"}
    if (digit2 == 7) {resultLine = resultLine + "LXX"}
    if (digit2 == 8) {resultLine = resultLine + "LXXX"}
    if (digit2 == 9) {resultLine = resultLine + "XC"}
    if (digit3 == 1) {resultLine = resultLine + "I"}
    if (digit3 == 2) {resultLine = resultLine + "II"}
    if (digit3 == 3) {resultLine = resultLine + "III"}
    if (digit3 == 4) {resultLine = resultLine + "IV"}
    if (digit3 == 5) {resultLine = resultLine + "V"}
    if (digit3 == 6) {resultLine = resultLine + "VI"}
    if (digit3 == 7) {resultLine = resultLine + "VII"}
    if (digit3 == 8) {resultLine = resultLine + "VIII"}
    if (digit3 == 9) {resultLine = resultLine + "IX"}
    return (resultLine)
}

func stringCheck (a: [String]) -> Bool
{
    var errorFound: Bool = false
    var i: Int = 0
    if (errorCode == 11) { errorFound = true; return errorFound}
    clearVariables()
    while (i < a.count)
    {
        //V Ошибки в правописании
        if (ConvertOneNumber(with: a[i]) < 0) && (a[i] != "hundert") && (a[i] != "und") { errorCode = 1; errorMember = i; errorFound = true; wrongWord1 = a[i]; return errorFound}
        
        //V Слово hundert не должно повторяться
        if (a[i] == "hundert") {if (hundertFound == false) {hundertFound = true} else {errorCode = 2; errorFound = true; return errorFound}}
        
        //V Слово und не должно повторяться
        if (a[i] == "und") {if (undFound == false) {undFound = true} else {errorCode = 3; errorFound = true; return errorFound}}
        
        //V Десятки не должны повторяться
        if (ConvertOneNumber(with: a[i]) > 9) {if (found10 == false) {found10 = true; wrongWord1 = a[i]} else {errorCode = 4; errorFound = true; wrongWord2 = a[i]; return errorFound}}
        
        //V Ввод начался со слова hundert
        if (a[0] == "hundert") {errorCode = 5; errorFound = true; return errorFound}
        
        //V Ввод начался со слова und
        if (a[0] == "und") {errorCode = 6; errorFound = true; return errorFound}
        
        if (a[0] == "ein") && (a.count == 1) { errorCode = 20; errorFound = true; return errorFound}
        
        if (a[i] == "eins") && (a.count > 1) { errorCode = 21; errorFound = true; return errorFound}

        if (a.count>1)
        {
            if (i>0)
            {
                if (a[i] == "und") && (ConvertOneNumber(with: a[i-1]) > 19) {errorCode = 8; errorFound = true; return errorFound}
                if (a[i] == "und") && (ConvertOneNumber(with: a[i-1]) > 9) && (ConvertOneNumber(with: a[i]) < 20) {errorCode = 9; errorFound = true; return errorFound}
                if (a[i] == "hundert") && (ConvertOneNumber(with: a[i-1]) > 19) {errorCode = 10; errorFound = true; return errorFound}
                if (a[i] == "hundert") && (ConvertOneNumber(with: a[i-1]) > 9) && (ConvertOneNumber(with: a[i]) < 20) {errorCode = 11; errorFound = true; return errorFound}
                if (a[i] == "und") && (a[i-1] == "hundert") {errorCode = 12; errorFound = true; return errorFound}
                if (a[i] == "hundert") && (a[i-1] == "und") {errorCode = 13; errorFound = true; return errorFound}
                if (ConvertOneNumber(with: a[i]) < 10) && (ConvertOneNumber(with: a[i]) > 0) && (ConvertOneNumber(with: a[i-1]) < 10) && (ConvertOneNumber(with: a[i-1]) > 0) {errorCode = 14; errorFound = true; wrongWord1 = a[i-1]; wrongWord2 = a[i]; return errorFound}
                if (ConvertOneNumber(with: a[i]) < 10) && (ConvertOneNumber(with: a[i]) > 0) && (ConvertOneNumber(with: a[i-1]) < 20) && (ConvertOneNumber(with: a[i-1]) > 10) {errorCode = 15; errorFound = true; wrongWord1 = a[i-1]; wrongWord2 = a[i]; return errorFound}
                if (ConvertOneNumber(with: a[i-1]) < 10) && (ConvertOneNumber(with: a[i-1]) > 0) && (ConvertOneNumber(with: a[i]) < 20) && (ConvertOneNumber(with: a[i]) > 10) {errorCode = 15; errorFound = true; wrongWord1 = a[i-1]; wrongWord2 = a[i]; return errorFound}
                if (ConvertOneNumber(with: a[i]) < 10) && (ConvertOneNumber(with: a[i]) > 0) && (ConvertOneNumber(with: a[i-1]) > 19) {errorCode = 16; wrongWord1 = a[i-1]; wrongWord2 = a[i]; errorFound = true; return errorFound}
                if (ConvertOneNumber(with: a[i-1]) < 10) && (ConvertOneNumber(with: a[i-1]) > 0) && (ConvertOneNumber(with: a[i]) > 19) {errorCode = 17; wrongWord1 = a[i]; wrongWord2 = a[i]; errorFound = true; return errorFound}
                if (a[i-1] == "und") && (ConvertOneNumber(with: a[i]) > 0) && (ConvertOneNumber(with: a[i]) < 10) { errorCode = 18; wrongWord1 = a[i]; errorFound = true; return errorFound}
                if (a[i-1] == "und") && (ConvertOneNumber(with: a[i]) > 10) && (ConvertOneNumber(with: a[i]) < 20) { errorCode = 19; wrongWord1 = a[i]; errorFound = true; return errorFound}
            }
        }
        //V Ввод закончился словом und
        if (i == a.count - 1) && (a[i] == "und") {errorCode = 7; errorFound = true; return errorFound}
        i += 1
    }
    return errorFound
}

func displayError () -> String
{
    var errorMessage: String = randomEmoji() + " "
    if (errorCode == 1) { errorMessage += "Ошибка в написании слова: '" + wrongWord1 + "'"}
    if (errorCode == 2) { errorMessage += "Слово 'hundert' повторилось!" }
    if (errorCode == 3) { errorMessage += "Слово 'und' повторилось!" }
    if (errorCode == 4) { errorMessage += "Десятки встретились более одного раза: '" + wrongWord1 + "' и '" + wrongWord2 + "'!"}
    if (errorCode == 5) { errorMessage += "Ввод начался со слова 'hundert'!"}
    if (errorCode == 6) { errorMessage += "Ввод начался со слова 'und'!"}
    if (errorCode == 7) { errorMessage += "Ввод закончен словом 'und'!"}
    if (errorCode == 8) { errorMessage += "Перед словом 'und' встречены десятки: '" + wrongWord1 + "'"}
    if (errorCode == 9) { errorMessage += "Перед словом 'und' встречено число от 11 до 19: '" + wrongWord1 + "'!"}
    if (errorCode == 10) { errorMessage += "Перед словом 'hundert' встречены десятки: '" + wrongWord1 + "'!"}
    if (errorCode == 11) { errorMessage += "Перед словом 'hundert' встречено число от 11 до 19: '" + wrongWord1 + "'!"}
    if (errorCode == 12) { errorMessage += "Слово 'hundert' встречено перед словом 'und'!"}
    if (errorCode == 13) { errorMessage += "Слово 'und' встречено перед словом 'hundert'!"}
    if (errorCode == 14) { errorMessage += "Единицы встречены подряд: '" + wrongWord1 + " " + wrongWord2 + "'!"}
    if (errorCode == 15) { errorMessage += "Эти числительные не могут идти подряд: '" + wrongWord1 + " " + wrongWord2 + "'!"}
    if (errorCode == 16) { errorMessage += "Десятки встречены перед единицами: '" + wrongWord1 + " " + wrongWord2 + "'!"}
    if (errorCode == 17) { errorMessage += "Единицы встречены перед десятками: '" + wrongWord1 + " " + wrongWord2 + "'!"}
    if (errorCode == 18) { errorMessage += "После 'und' встречены единицы: '" + wrongWord1 + "'!"}
    if (errorCode == 19) { errorMessage += "После 'und' встречено число от 11 до 19: '" + wrongWord1 + "'!"}
    if (errorCode == 20) { errorMessage += "Неверное число: 'ein'! Возможно, Вы имели ввиду 'eins'"}
    if (errorCode == 21) { errorMessage += "Неверное число: 'eins'! Возможно, Вы имели ввиду 'ein'"}
    return errorMessage
}

func ConvertToNumber (a: [String]) -> Int
{
    var resultNumber: Int = 0
    if (a.count == 1) { resultNumber = ConvertOneNumber(with: a[0])}
    if (a.count == 2) && (a[1] == "hundert") { resultNumber = ConvertOneNumber(with: a[0])*100 }
    if (a.count == 3) && (a[1] == "hundert") { resultNumber = ConvertOneNumber(with: a[0])*100 + ConvertOneNumber(with: a[2])}
    if (a.count == 3) && (a[1] == "und") { resultNumber = ConvertOneNumber(with: a[0]) + ConvertOneNumber(with: a[2])}
    if (a.count == 5) && (a[1] == "hundert") && (a[3] == "und") { resultNumber = ConvertOneNumber(with: a[0])*100 + ConvertOneNumber(with: a[2]) + ConvertOneNumber(with: a[4])}
    return resultNumber
}

struct ContentView: View {
    @State private var input: String = ""
    @State private var result: Int = 0
    
    func ConvertToDigits(with variable: String) -> String
    {
        var inputString: String = variable
        var outputString: String = variable
        inputString = inputString.lowercased()
        let components = inputString.components(separatedBy: .whitespacesAndNewlines)
        let words = components.filter { !$0.isEmpty }
        clearVariables()
        if (stringCheck(a: words) == false)
        { outputString = String(ConvertToNumber(a: words))}
        else { outputString = displayError(); clearVariables()}
        return outputString

    }
    
    var body: some View {
            VStack {
            Text("Введите любое число от 1 до 999 на немецком прописью")
                Text("🇩🇪")
                TextField("например, 'vier und zwanzig'", text: $input).frame(width:300, height:30)
                Text(ConvertToDigits(with: input))
                Text(ConvertToRoman(with: ConvertToDigits(with: input)))
            }.frame(width: 580, height: 200)
        }
                   
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
