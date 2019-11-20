package FaireMesObjets;

public class MaSomme {

	 static int a = 44;
	 static int b = 37;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ClassInput obj0 = new ClassInput(7,77);
		ClassInput obj1 = new ClassInput(77,77);
		ClassInput obj2 = new ClassInput(0,0);
		ClassInput obj3 = new ClassInput(0,0);
		ClassInput obj4 = new ClassInput(a,b);
		
		System.out.println("La superficie est de :" + obj0.getLargeur() * obj0.getLongueur());
		System.out.println("La superficie est de :" + obj1.mTHDSum());
		System.out.println("La superficie est de :" + obj2.mTHDSum2(10, 100));
		System.out.println("La superficie est de :" + obj2.getLargeur() * obj2.getLongueur());
		System.out.println("La superficie est de :" + obj3.mTHDSum2(150, 100));
		System.out.println("La superficie est de :" + obj4.mTHDSum2(a, b));
	}

}
