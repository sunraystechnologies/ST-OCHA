package in.co.sunrays.proj4.model.test;

import in.co.sunrays.proj4.util.DataValidator;

public class ValidationTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
	
		if (DataValidator.isNull("22") || !DataValidator.isInteger("kkkkkkkkkkkkkkkkk")) {
			System.out.println(false);
		} else {
			System.out.println(true);
		}
		
	}

}
