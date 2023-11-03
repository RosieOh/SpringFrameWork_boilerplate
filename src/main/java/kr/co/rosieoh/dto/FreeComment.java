package kr.co.rosieoh.dto;

import lombok.Data;

@Data
public class FreeComment {
    private int cno;
    private int fno;
    private String content;
    private String resdate;
    private String author;
    private String name;
}
