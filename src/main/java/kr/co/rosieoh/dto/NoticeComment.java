package kr.co.rosieoh.dto;

import lombok.Data;

@Data
public class NoticeComment {
    private int cno;
    private int nno;
    private String content;
    private String resdate;
    private String author;
    private String name;
}
