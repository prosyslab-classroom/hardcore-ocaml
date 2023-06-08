# 꼬리 재귀

## 목표
긴 재귀 호출을 효율적으로 수행하는 함수를 구현할 수 있어야 한다.

## 구현
`./tail [길이]`를 실행하면 해당 길이만큼 `0`을 원소로 갖는 리스트를 생성한 후, `length_unopt` 함수를 이용하여 해당 리스트의 길이를 재고 출력한다. 당연히 입력으로 준 길이와 같아야 한다.
하지만 `length_unopt`는 리스트가 긴 경우 매우 비효율적이거나 스택오버플로우 때문에 돌아가지 않는다.

이를 해결하기 위하여, 효율적인 길이함수 `length_opt`를 작성하라. 이 함수는 `./tail -opt [길이]`로 호출할 수 있다.

## 규칙
- 순환문은 재귀 호출로 구현하고 `for` 문을 사용하지 않는다.
- 원소 천만개짜리 리스트를 수 초 안에 처리하여야 한다. 참고로, Intel(R) Xeon(R) Gold 6226R CPU @ 2.90GHz 에서 아래와 비슷한 성능이 나온다.
```console
$ time ./tail 10000000
Fatal error: exception Stack_overflow
$ time ./tail -opt 10000000
10000000
./tail -opt 10000000  0.87s user 0.18s system 99% cpu 1.050 total
```