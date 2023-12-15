package kr.co.boilerplate.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentVO {
    //결제
    private int sno;	        //(auto)결제번호
    private String cid;         //고객아이디
    private int pno;            //상품번호
    private int amount;         //구매수량
    private String pmethod;	    //+결제수단
    private String pcom;		//+결제 대행사
    private String cnum;		//+결제카드(계좌)번호
    private int payprice;		//+결제금액
    private String dno;            //배송코드
    private String pname;       //상품명
    private int pstate;         //배송 상태
}
