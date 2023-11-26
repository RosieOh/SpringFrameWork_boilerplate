package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Apply {
    private int ano;
    private int lno;
    private String id;
    private boolean complete;
    private boolean book;
    private int a_price;
    private String bname;
    private String lname;
    private String sdate;
    private String edate;
    private String imgsrc1;
    private String imgsrc2;
    private String imgsrc3;
    private String name;
    private String cancel;
    private int pt;
    private int apply_mn;
}
