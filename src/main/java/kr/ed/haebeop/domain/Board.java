package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {
    private int bno;
    private String title;
    private String content;
    private String nickname;
    private String regdate;
    private int visited;
}
