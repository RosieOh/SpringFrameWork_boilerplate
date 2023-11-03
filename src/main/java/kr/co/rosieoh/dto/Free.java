package kr.co.rosieoh.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Free {
    private int fno;
    private String title;
    private String content;
    private String regdate;
    private int visited;
    private String id;
    private int rec;
    private int count;
}
