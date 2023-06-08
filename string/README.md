# 문자열

## 목표
OCaml 에서 `String` 값을 효율적으로 다루면서 성능을 최적화 할 수 있어야 한다.

## 구현
`./string [길이]`를 실행하면 먼저 해당 개수만큼 정수 원소를 갖는 `List` 타입의 값을 생성한 후,
각 원소를 문자열로 만들어서 접합한다.
그리고 난 후 만든 문자열의 길이를 출력하는 코드가 이미 구현되어 있다.

OCaml에서 문자열을 이어붙이는 가장 쉬운 방법은 `String.cat` (`^`) 연산을 사용하는 것이다.
하지만 문자열이 긴 경우 매우 비효율적이다.

이를 해결하기 위하여, 문자열을 접합하는 `to_string_opt` 함수를 효율적으로 작성하라.
이 모듈은 `./string -opt [개수]`로 실행할 수 있다.

## 규칙
- 순환문은 재귀 호출로 구현하고 `for` 문을 사용하지 않는다.
- 백만개 원소를 생성하고 접합하는 데 1초를 넘지 않아야 한다. 참고로, Intel(R) Xeon(R) Gold 6226R CPU @ 2.90GHz 에서 아래와 비슷한 성능이 나온다.
```console
$ time ./string 1000000
timeout (>5 min)
$ time ./string -opt 1000000
5888890
./string -opt 1000000  0.24s user 0.01s system 99% cpu 0.253 total
```

## 참고자료
- [Lists and Patterns, Real World OCaml](https://dev.realworldocaml.org/lists-and-patterns.html#performance-of-string.concat-and)
