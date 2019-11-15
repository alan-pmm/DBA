package com.sopra.javabasico.capitulo4;


import java.util.Random;
/**
 * @author alain
 * MAIN – Se implementará en la clase anterior el método main que muestre por pantalla la frase “Estoy aprendiendo a programar en Java”.
 * ARGUMENTOS – Se implementará en la clase anterior una funcionalidad de que muestre por pantalla el argumento que se haya recibido: “Me has mandado el texto: …”.
 *
 */
//MAIN CLASS
public class Capitulo4 {

	


	/**
	* VARIABLES DE CLASE – Se deberán crear cinco variables de clase en la clase Capitulo3.java. 
	* Dos de ellas deben ser primitivas de datos a elección,
	*  otra, debe tener el tipo de dato Random; 
	* y las otras dos variables deben ser estáticas y de tipo String 
	* (una de ellas debe inicializarse con el valor “Esto es un String”).
	*/
	//VARIABLES CLASS--------------------
	private int primA;
	private int primB;
	private static Random randA;
	private static String staticVar1 = "";
	private static String staticVar2 = "Esto es un String";	
	
	

	
	/**CONSTRUCTORES – Se deberá crear un constructor público para la clase Capitulo3.java que inicialice los tres primeros atributos creados en el punto anterior.*/
	// CONSTRUCTOR 1--------------------
	public Capitulo4(Random randA) {
		super();
		this.primA = primA;
		this.primB = primB;
		this.randA = new Random(); // REFERENCES WE CREATE AN OBJECT
	}
	
	// CONSTRUCTOR 2--------------------
	public Capitulo4(String str1Const1) {
		this.staticVar2 = str1Const1 + " + con un constructor"; 
	}

	//public Capitulo4() { // DEFAULT CONSTRUCTOR, CONSTRUCTOR HAS THE SAME NAME AS THE CLASS}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("aprendiendo Java");
		System.out.println("Me has mandado el texto: …" + args);
	
		//NEW OBJECT 1--------------------
		/*** Se deberá crear un objeto de la clase Random (del paquete java.util) e implementar 
		 * una funcionalidad que imprima por pantalla un número aleatorio del 0 al 9. * ¿Qué sucedería al importar, además, el paquete java.util utilizando el carácter comodín, * (asterisco)?
		 * @author alain
		 */   
		//Random randA = new Random();
		// /* Almacena un número aleatorio.*/
		
		Capitulo4 rant = new Capitulo4(randA);
		System.out.println("randomisation is: " + rant  );
		//NEW OBJECT 2--------------------
		Capitulo4 capitulo4 = new Capitulo4(staticVar2);
		System.out.println(capitulo4.staticVar2);
		System.out.println(capitulo4.mTH2());
	}
	
	//METHOD 1--------------------CHANGE Random TO int (NO CONSIGO ...)
	public int mTH1() {
	int r = randA.nextInt(10);
	return r;
	}
	
	//METHOD 2--------------------
	public String mTH2(){
		return staticVar2 + " con Un Methodo";
		}
	


}

//.