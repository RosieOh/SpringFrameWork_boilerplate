package kr.co.teaspoon.dto;

import lombok.*;
import org.checkerframework.checker.lock.qual.GuardedBy;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Sample {
    private int no;
    private String name;
}
