package kr.co.rosieoh.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
    private int nno;
    private String title;
    private String content;
    private String resdate;
    private int visit;
    private int count;
}
