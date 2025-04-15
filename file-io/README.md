# 파일 읽고 쓰기

## 목표
큰 파일을 빠르게 읽고 쓸 수 있어야 한다. 이를 위하여 꼬리 재귀 함수를 이용할 수 있어야 한다.

## 구현
#### 큰 파일 생성기
`./gen [줄 수]`를 실행하면 해당 줄만큼 랜덤 숫자가 채워진 `large.txt` 파일이 생성되어야 한다. 이를 위해서, [gen.ml](src/gen.ml)의 `generate` 함수를 작성한다.
#### 큰 파일 처리기
`./read large.txt`를 실행하면 모든 줄에 있는 숫자를 읽은 후 짝수의 개수를 출력되어야 한다. 하지만 여기서 사용되는 함수 `read_file_unopt`는 비효율적이다.
파일이 큰 경우 느리거나 스택오버플로우를 유발한다.

이를 해결하기 위해서, [read.ml](src/read.ml)의 `read_file_opt` 함수를 작성하라. 이 함수는 `./read -opt large.txt`로 호출할 수 있다.

## 규칙
- 반복문은 재귀 호출로 구현하고 `for` 문을 사용하지 않는다.
- 1억줄짜리 파일을 읽고 쓰는데 1분을 넘지 않아야 한다. 참고로, Intel(R) Xeon(R) Gold 6226R CPU @ 2.90GHz 에서 아래와 비슷한 성능이 나온다.
```console
$ time ./gen 100000000
./gen 100000000  12.16s user 0.30s system 99% cpu 12.457 total
$ time ./read large.txt
Fatal error: exception Stack_overflow
$ time ./read -opt large.txt
./read large.txt  18.16s user 3.02s system 99% cpu 21.184 total
49998854
```
