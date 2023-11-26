package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Video {
    private int vno;
    private String title;
    private String img;
    private String content;
    private String videofile;
    private String teacher;
    private String resdate;
    private int visit;
}
