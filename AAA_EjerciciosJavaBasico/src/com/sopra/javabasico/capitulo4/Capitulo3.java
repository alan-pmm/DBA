package com.sopra.javabasico.capitulo4;


/**
 * Copyright 2018.
 */

/*
 * Se crea el paquete com.sopra.javabasico.capitulo3 (Paso 1)
 */

/* 1.  PAQUETES – Se deberá crear un paquete llamado com.sopra.javabasico.capitulo3.
*  2.  CREACIÓN DE CLASE – Se deberá crear una clase llamada Capitulo3.java en com.sopra.javabasico.capitulo3.
*  3.  DOCUMENTACIÓN MEDIANTE JAVADOC – Se documentarán la clase, métodos, constructores y distintas variables utilizadas mediante
*      comentarios de Javadoc para poder crear la documentación del código.
*  4.  MAIN – Se implementará en la clase anterior el método main que muestre por pantalla la frase “Estoy aprendiendo a programar
*      en Java”.
*  5.  ARGUMENTOS – Se implementará en la clase anterior una funcionalidad de que muestre por pantalla el argumento que se haya recibido:
*      “Me has mandado el texto: …”.
*  6.  CREACIÓN DE OBJETOS e IMPORTACIONES – Se deberá crear un objeto de la clase Random (del paquete java.util) e implementar una 
*      funcionalidad que imprima por pantalla un número aleatorio del 0 al 9. ¿Qué sucedería al importar, además, el paquete java.util 
*      utilizando el carácter comodín, * (asterisco)?
*  7.  VARIABLES DE CLASE – Se deberán crear cinco variables de clase en la clase Capitulo3.java. Dos de ellas deben ser primitivas de 
*      datos a elección, otra, debe tener el tipo de dato Random; y las otras dos variables deben ser estáticas y de tipo String (una de
*      ellas debe inicializarse con el valor “Esto es un String”).
*  8.  CONSTRUCTORES – Se deberá crear un constructor público para la clase Capitulo3.java que inicialice los tres primeros atributos creados
*      en el punto anterior.
*  9.  BLOQUES INICIALIZADORES DE INSTANCIAS – Se crearán dos bloques inicializadores de instancias. El primero, al final de la clase, deberá
*      mostrar por pantalla el mensaje “Este bloque es un inicializador de instancia” y el segundo, al principio de la clase, deberá imprimir 
*      por pantalla la variable num. ¿Qué ocurre con cada uno de los bloques?
*  10. CREACIÓN DE OBJETOS – Se deberá crear un objeto de la clase Capitulo3 en el método main, pasando como parámetros los valores que se desee.
*      (Si uno de los argumentos del constructor de la clase Capitulo3 es de tipo numérico, deberá introducirse en modo octal o hexadecimal).
*  11. Se deberán mostrar por pantalla (dentro del método main) los valores de los dos String creados y de los tres atributos de la clase. Para el 
*      atributo de tipo Random, se mostrará por pantalla un número aleatorio del 0 al 5.
*  12. VARIABLES LOCALES – Se deberá crear una variable local dentro del constructor de la clase e inicializarla. ¿Es posible acceder a esta variable
*      fuera del constructor?
*  13. ORDENANDO ELEMENTOS EN UNA CLASE – Llegados a este punto, sería adecuado echar un vistazo al orden de los elementos de la clase, ¿sigue el 
*      formato explicado en la teoría del Capítulo 3?
*  14. DESTRUYENDO OBJETOS – Por último, se crearán dos objetos Capitulo3 en el método main, y después, se asignará el valor null a ambos. 
*      ¿Algún objeto ha sido recogido por el Garbage Collector? Es necesario asegurarse de ello haciendo uso del método finalize()
*/

import java.util.Random;
import java.util.*;


/**
 * Clase que implementa un ejemplo que utiliza un constructor devolviendo el valor de sus argumentos por pantalla, devuelve el valor
 * de un número aleatorio y hace uso del Garbage Collector.
 *
 * @author autor1
 * @version 2.0
 * @since 2018
 *
 */
public class Capitulo3 {
    /*
     * Puesto que num todavía no ha sido creada, no es posible hacer uso de ella en un bloque.
     */
    //{System.out.println(num);}
    
    /**
     * Almacena un carácter
     */
    char c;
    
    /**
     * Almacena un número comprendido entre -2^31 (-2.147.483.648) y (2^31)-1 (2.147.483.647)
     */
    int num;
    
    /**
     * Almacena un número aleatorio.
     */
    Random r;
    
    /**
     * Cada variable almacena una cadena de caracteres 
     */
    static String s1 = "Esto es un String", s2;

    /**
     * Constructor de la clase con dos argumentos.
     *
     * @param c
     *      variable primitiva de tipo char
     * @param num
     *      variable primitiva de tipo int
     */
    public Capitulo3(char c, int num) {
        this.c = c;
        this.num = num;
        r = new Random();

       // int varLocal = 5;
    }

    /**
     * Método main principal
     *
     * @param args
     */
    public static void main(String[] args) {
        System.out.println("Estoy aprendiendo a programar en Java");

        System.out.println("Me has mandado el texto: " + args[0]);

        Random r = new Random();
        System.out.println(r.nextInt(10));

        Capitulo3 c3 = new Capitulo3('A', 0x1A);

        System.out.println(s1);
        System.out.println(s2);
        System.out.println("Atributos del objeto c3: ");
        System.out.println(c3.c);
        System.out.println(c3.num);
        System.out.println(c3.r.nextInt(6));

        /*
         * Si se intenta acceder a varLocal, la variable local que se ha creado en el constructor de la clase Capitulo3,
         * se podrá ver un error de compilación, ya que no es posible acceder a una variable local fuera de su bloque
         */
        // System.out.println(c3.varLocal);

        Capitulo3 c1 = new Capitulo3('B', 1);
        Capitulo3 c2 = new Capitulo3('C', 2);
        c1 = null;
        c2 = null;

        System.gc();
    }

    @Override
    protected void finalize() throws Throwable {
        System.out.println("El Garbage Collector ha sido ejecutado");
    }
    
    {System.out.println("Este bloque es un inicializador de instancia");}

    /*
     * Para la ejecución final del programa, este deberá mostrar en la consola: 
     * 
     * Estoy aprendiendo a programar en Java 
     * Me has mandado el texto: Texto 
     * 7  (En este caso, se el número será aleatorio)
     * Este bloque es un inicializador de instancia
     * Esto es un String
     * null
     * Atributos del objeto c3: 
     * A 
     * 26 (número hexadecimal transformado a base 10) 
     * 1 (De nuevo, esto será un número aleatorio)
     * Este bloque es un inicializador de instancia
     * Este bloque es un inicializador de instancia        
     * El Garbage Collector ha sido ejecutado 
     * El Garbage Collector ha sido ejecutado
     */
}
