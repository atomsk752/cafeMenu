package org.atomsk.domain;


import lombok.Data;

@Data
public class BillsVO {
    private int ono, mnum, mprice, cnt;
    private String mname;
}
