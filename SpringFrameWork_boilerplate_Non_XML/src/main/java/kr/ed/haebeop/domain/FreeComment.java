package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FreeComment {
    private int cno;
    private int fno;
    private String content;
    private String resdate;
    private String author;
    private String name;
}
