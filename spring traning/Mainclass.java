package testPjt;

import org.springframework.context.support.GenericXmlApplicationContext;

public class Mainclass {
	public static void main(String[] args) {
//		Transportationwalk transpotationwalk = new Transportationwalk();
//		transpotationwalk.move();
		
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationContext.xml");
		
		Transportationwalk transportationwalk = ctx.getBean("tWalk", Transportationwalk.class);
		transportationwalk.move();
		
		ctx.close();
	}
}
