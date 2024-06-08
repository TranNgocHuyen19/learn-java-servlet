/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;

/**
 *
 * @author Trần Ngọc Huyền
 */
public class Math implements Serializable {

    private String num1 = "";
    private String num2 = "";
    private String op = "";

    public Math() {
    }

    public Math(String num1, String num2, String op) {
        this.num1 = num1;
        this.num2 = num2;
        this.op = op;
    }

    public String getNum1() {
        return num1;
    }

    public void setNum1(String num1) {
        this.num1 = num1;
    }

    public String getNum2() {
        return num2;
    }

    public void setNum2(String num2) {
        this.num2 = num2;
    }

    public String getOp() {
        return op;
    }

    public void setOp(String op) {
        this.op = op;
    }

    public String getResult() {
        String rs = "";
        try {
            double a, b;
            a = Double.parseDouble(num1);
            b = Double.parseDouble(num2);

            switch (op) {
                case "+":
                    rs = "Tổng: " + (a + b);
                    break;
                case "-":
                    rs = "Hiệu: " + (a - b);
                    break;

                case "*":
                    rs = "Tích: " + (a * b);
                    break;
                case "/":
                    if(b == 0){
                        rs = "Không chia được cho 0";
                        break;
                    }
                    rs = "Thương: " + (a / b);
                    break;

            }

        } catch (NumberFormatException e) {
            rs = "Phải nhập số";
        }
        return rs;
    }

}
