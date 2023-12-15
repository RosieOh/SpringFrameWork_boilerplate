package kr.co.boilerplate.util;

import java.util.HashSet;
import java.util.List;
import java.util.regex.Pattern;

public class BadWordFilter extends HashSet<String> implements BadWords, ReadURL, ReadFile {
    private String substituteValue = "*";

    // 대체 문자 지정
    // 기본값 : *
    public BadWordFilter() {
        addAll(List.of(koreaWord1)); // 초기화할 비속어 목록
    }

    public BadWordFilter(String substituteValue) {
        this.substituteValue = substituteValue;
    }

    // 비속어를 감지하여 대체 문자로 변경
    public String change(String text) {
        // 비속어 목록에 있는 단어들을 찾아서 대체 문자로 변경
        String[] words = stream().filter(text::contains).toArray(String[]::new);
        for (String v : words) {
            String sub = this.substituteValue.repeat(v.length());
            text = text.replace(v, sub);
        }
        return text;
    }

    // 문자열에서 지정된 문자열을 기준으로 비속어 감지하여 대체 문자로 변경
    public String change(String text, String[] sings) {
        // 정규 표현식 패턴을 생성하여 문자열을 검색 및 대체
        StringBuilder stringBuilder = new StringBuilder("[");
        for (String sing : sings) stringBuilder.append(Pattern.quote(sing));
        stringBuilder.append("]*");
        String patternText = stringBuilder.toString();

        for (String word : this) {
            if (word.length() == 1) {
                text = text.replace(word, substituteValue);
            }
            String[] chars = word.chars().mapToObj(Character::toString).toArray(String[]::new);
            text = Pattern.compile(String.join(patternText, chars))
                    .matcher(text)
                    .replaceAll(v -> substituteValue.repeat(v.group().length()));
        }
        return text;
    }

    // 비속어 감지 여부 확인
    public boolean check(String text) {
        return stream().anyMatch(text::contains);
    }

    // 문자열에서 공백을 제거하고 비속어 감지 여부 확인
    public boolean blankCheck(String text) {
        return check(text.replace(" ", ""));
    }

    // 비속어 감지 여부에 따라 메시지 반환
    public String messagePrint(String text) {
        String msg = "";
        if (check(text)) {
            msg = "비속어나 욕설이 존재합니다.";
        } else {
            msg = "비속어나 욕설이 포함되어 있지 않습니다.";
        }
        return msg;
    }
}
