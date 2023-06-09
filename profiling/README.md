# 프로파일링

## 목표
OCaml 에서 프로파일러를 사용하여 비효율적으로 동작하는 부분을 짚어 낼 수 있어야 한다.

## 구현
앞선 문자열 문제와 같은 코드가 구현되어 있다.
문자열 문제를 풀었다면, 그 코드를 `to_string_opt` 에 복사해 넣도록 한다.

여기서는 `memtrace` 라는 메모리 프로파일러를 사용한다.
프로그램이 메모리를 지나치게 많이 사용하면, 프로그램 수행시간도 길어지는 경우가 많다.
메모리 할당과 수거 시간이 오래 걸리기 때문이다.
자세한 사용법은 개발자의 [블로그](https://blog.janestreet.com/finding-memory-leaks-with-memtrace/)를 참고한다.

## 규칙
- 최적화 이전과 이후 코드를 프로파일링 해보고 메모리 사용량을 측정해본다. 다양하게 인자를 바꾸어 가면서 변화를 살펴본다.
```console
$ MEMTRACE=trace.ctf ./profiling 100000
$ memtrace-viewer trace.ctf
$ MEMTRACE=trace-trace.ctf ./profiling -opt 100000
$ memtrace-viewer trace-opt.ctf
```

## 참고자료
- [Memtrace](https://blog.janestreet.com/finding-memory-leaks-with-memtrace/)
