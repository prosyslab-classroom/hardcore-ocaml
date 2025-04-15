# 직렬화

## 목표
자료 구조를 직렬화하여 간편하게 파일로 저장하고 다시 읽을 수 있어야 한다.

## 구현
`./gen [줄 수]`를 실행하면 해당 줄만큼 랜덤 숫자가 채워진 리스트를 생성하고 이를 `large.out` 에 저장한다.
`./read large.out`를 실행하면 모든 줄에 있는 숫자를 읽은 후 짝수의 개수를 출력되어야 한다.
기본적으로 정수 리스트는 문자열로 변환하여 파일로 저장하기가 쉽고, 이를 다시 읽어들이기도 쉽다.
이 과정이 이미 구현되어 있다.

하지만 복잡한 자료구조인 경우 이러한 과정을 구현하기가 번거로운 경우가 많다.
매번 형식에 따라 출력하는 코드를 작성해야하고, 이를 파싱하는 코드도 작성해야한다.

OCaml에서는 자료구조를 직렬화하는 `Marshal` 모듈을 제공한다. 이를 이용하면
복잡한 자료구조라도 바로 파일에 저장하고, 다시 그대로 읽을 수 있다.

`Marshal`을 이용하여 리스트를 파일에 직접 쓰고 바로 읽는 함수
`generate_opt`와 `read_file_opt`를 작성하라.

## 규칙
- 반복문은 재귀 호출로 구현하고 `for` 문을 사용하지 않는다.
- 백만 줄짜리 파일을 읽고 쓰는데 1초을 넘지 않아야 한다. 참고로, Intel(R) Xeon(R) Gold 6226R CPU @ 2.90GHz 에서 아래와 비슷한 성능이 나온다.
```console
$ time ./gen 1000000
./gen 1000000  12.16s user 0.30s system 99% cpu 12.457 total
$ time ./read large.txt
Fatal error: exception Stack_overflow
$ time ./gen -opt 1000000
./gen -opt 1000000  0.36s user 0.09s system 99% cpu 0.449 total
$ time ./read -opt large.out
500059
./read -opt large.out  0.05s user 0.04s system 99% cpu 0.091 total
```
