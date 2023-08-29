# 프로파일링

## 목표
OCaml 에서 프로파일러를 사용하여 비효율적으로 동작하는 부분을 짚어 낼 수 있어야 한다.

## 구현
앞선 문자열 문제와 같은 코드가 구현되어 있다.
문자열 문제를 풀었다면, 그 코드를 `to_string_opt` 에 복사해 넣도록 한다.

여기서는 두 가지 프로파일러를 사용한다. 
- 실행시간 프로파일러 `landmarks`: 각 함수마다 몇 번이 호출되었고, 수행시간이 얼마나 긴지 측정한다.
- 메모리 프로파일러 `memtrace`: 프로그램이 메모리를 지나치게 많이 사용하면, 프로그램 수행시간도 길어지는 경우가 많다.
메모리 할당과 수거 시간이 오래 걸리기 때문이다. `memtrace` 는 어떤 함수가 얼마나 많은 메모리 공간을 할당하는지를 측정한다.
자세한 사용법은 개발자의 [블로그](https://blog.janestreet.com/finding-memory-leaks-with-memtrace/)를 참고한다.

프로파일러를 사용하기 위해서는 프로젝트를 빌드할 때와 실행할 때 옵션을 주어야 한다. 자세한 사용법은 아래 규칙과 `Makefile`, `src/dune`, 각 프로파일러의 홈페이지를 참고한다.

## 규칙
- 최적화 이전과 이후 코드를 프로파일링 해보고 메모리 사용량을 측정해본다. 다양하게 인자를 바꾸어 가면서 변화를 살펴본다.
```console
# 실행시간 프로파일링
$ OCAML_LANDMARKS=on ./profiling 100000
$ OCAML_LANDMARKS=on ./profiling -opt 100000
# 메모리 프로파일링
$ MEMTRACE=trace.ctf ./profiling 100000
$ memtrace-viewer trace.ctf
$ MEMTRACE=trace-trace.ctf ./profiling -opt 100000
$ memtrace-viewer trace-opt.ctf
```

## 참고자료
- [Landmarks](https://github.com/LexiFi/landmarks)
- [Memtrace](https://blog.janestreet.com/finding-memory-leaks-with-memtrace/)
