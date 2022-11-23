//클로저는 정의된 컨텍스트에서 모든 상수 및 변수에 대한 참조를 캡처하고 저장할 수 있습니다. 이것은 이러한 상수와 변수 를 닫는 것으로 알려져 있습니다 . Swift는 캡처의 모든 메모리 관리를 처리합니다.

//Swift의 클로저 표현식은 일반적인 시나리오에서 간결하고 깔끔한 구문을 장려하는 최적화와 함께 깨끗하고 명확한 스타일을 가지고 있습니다. 이러한 최적화에는 다음이 포함됩니다.

// MARK: - 클로저 표현식
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by:backward)

//이 sorted(by:)메서드는 배열의 내용과 동일한 유형의 두 인수를 사용하는 클로저를 허용하고 Bool값이 정렬되면 첫 번째 값이 두 번째 값 앞이나 뒤에 나타나야 하는지 여부를 나타내는 값을 반환합니다. 정렬 클로저 는 첫 번째 값이 두 번째 값 앞에true 나타나야 하는 경우 반환해야 하고 그렇지 않으면 false를 반환해야 합니다.


//클로저 표현식 구문

//클로저 표현식 구문은 다음과 같은 일반 형식을 갖습니다.
//{ (parameters) -> return type in
//    statements
//}
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})


//컨텍스트에서 유형 유추
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
//정렬 클로저가 메소드에 대한 인수로 전달되기 때문에 Swift는 매개변수의 유형과 리턴하는 값의 유형을 유추할 수 있습니다. 이 sorted(by:)메서드는 문자열 배열에서 호출되므로 해당 인수는 유형의 함수여야 합니다 .


//단일 표현식 클로저의 암시적 반환
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
//return단일 식 클로저 는 이전 예제의 이 버전에서와 같이 선언에서 키워드를 생략하여 단일 식의 결과를 암시적으로 반환할 수 있습니다 .


//단축 인수 이름
reversedNames = names.sorted(by: { $0 > $1 } )
//클로저 표현식 내에서 이러한 속기 인수 이름을 사용하는 경우 클로저의 인수 목록을 정의에서 생략할 수 있습니다.

//연산자 방법
//위의 종결 표현식을 쓰는 훨씬 더 짧은 방법이 있습니다. 스위프트의 문자열 유형은 문자열 유형의 두 매개 변수를 갖는 메서드로 greater-than 연산자(>)의 문자열 특정 구현을 정의하고 부울 유형의 값을 반환한다.
reversedNames = names.sorted(by: >)

