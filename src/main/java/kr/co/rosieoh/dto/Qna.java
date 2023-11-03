package kr.co.rosieoh.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Qna {
    private int qno;
    private String title;
    private String content;
    private String author;
    private String resdate;
    private String visit;
    private int lev;
    private int par;
    private boolean secret;
    private String name;
    private int count;
}
