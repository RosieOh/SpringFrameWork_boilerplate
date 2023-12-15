package kr.co.boilerplate.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Set;
import java.util.StringTokenizer;

// ReadFile 인터페이스 정의
interface ReadFile extends Set<String> {
    // 파일을 읽고 내용을 처리하는 메서드
    default void readFile(File file, String delim, boolean rmBlank) {
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            // 파일 내용을 저장할 StringBuilder 생성
            StringBuilder fileContent = new StringBuilder();
            // 파일의 각 라인을 fileContent에 추가
            reader.lines().forEach(fileContent::append);
            // StringTokenizer를 사용하여 파일 내용을 토큰으로 분리
            StringTokenizer tokenizer = delim == null
                    ? new StringTokenizer(fileContent.toString()) // 구분자가 지정되지 않은 경우
                    : new StringTokenizer(fileContent.toString(), delim); // 구분자가 지정된 경우

            if (rmBlank) {
                // rmBlank가 true인 경우 공백 제거 후 토큰을 Set에 추가
                while (tokenizer.hasMoreTokens()) add(tokenizer.nextToken().strip());
            } else {
                // rmBlank가 false인 경우 토큰을 그대로 Set에 추가
                while (tokenizer.hasMoreTokens()) add(tokenizer.nextToken());
            }
        } catch (IOException e) {
            // 파일 읽기 중 오류 발생 시 RuntimeException으로 예외 처리
            throw new RuntimeException(e);
        }
    }

    // 파일 경로를 입력으로 받아 기본 설정으로 파일 읽기 수행
    default void readFile(String path) {
        readFile(path, null, true);
    }

    // 파일 경로와 구분자를 입력으로 받아 파일 읽기 수행
    default void readFile(String path, String delim) {
        readFile(path, delim, true);
    }

    // 파일 경로와 공백 제거 여부를 입력으로 받아 파일 읽기 수행
    default void readFile(String path, boolean rmBlank) {
        readFile(path, null, rmBlank);
    }

    // 파일 경로, 구분자, 공백 제거 여부를 입력으로 받아 파일 읽기 수행
    default void readFile(String path, String delim, boolean rmBlank) {
        readFile(new File(path), delim, rmBlank);
    }

    // 파일 객체를 입력으로 받아 기본 설정으로 파일 읽기 수행
    default void readFile(File file) {
        readFile(file, null, true);
    }

    // 파일 객체와 구분자를 입력으로 받아 파일 읽기 수행
    default void readFile(File file, String delim) {
        readFile(file, delim, true);
    }

    // 파일 객체와 공백 제거 여부를 입력으로 받아 파일 읽기 수행
    default void readFile(File file, boolean rmBlank) {
        readFile(file, null, rmBlank);
    }
}
