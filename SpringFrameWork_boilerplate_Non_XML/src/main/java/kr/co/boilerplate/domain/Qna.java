package kr.co.boilerplate.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Qna {
    private int qno;
    private String title;
    private String content;
    private String author;
    private String resdate;
    private int lev;
    private int par;
}
