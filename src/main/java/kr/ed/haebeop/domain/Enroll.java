package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Enroll {
    private int eno;
    private int cno;
    private String id;
    private boolean complete;
    private boolean book;
    private int enroll_price;
    private String book_name;
    private String course_name;
    private String start_date;
    private String end_date;
    private String imgsrc1;
    private String name;
}
