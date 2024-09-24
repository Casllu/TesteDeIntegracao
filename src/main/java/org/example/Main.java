package org.example;

public class Main {
	public static void main(String[] args) {
		int a,b;
		int resultInt;
		double resultDouble;
		double d,e;
		Calculadora c = new Calculadora();
		a=20;
		b=47;
		d=12;
		e=33.9;
		resultInt = c.soma(a,b);
		System.out.println(resultInt);
		resultDouble = c.divisaoD(d , e);
		System.out.println(resultDouble);
	}
}