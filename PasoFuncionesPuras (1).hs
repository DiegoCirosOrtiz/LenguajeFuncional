-- PasoFuncionesPuras.hs

{- |
  Programa en Haskell que muestra cómo se puede pasar una función como
  parámetro a otra función. En este caso se demuestra el uso de funciones
  puras (sin efectos secundarios) y cómo pueden tratarse como valores.

  La idea principal es que una función puede recibir otra función
  para hacer operaciones diferentes sin cambiar su estructura. Esto se conoce
  como una función de orden superior.

  Curso: MCA 1 2026-1 FCiencias
  Tema: Paso de una función como parámetro / Funciones de Orden Superior
  Software: GHC (Glasgow Haskell Compiler)
  Autor: Diego Ciros Ortiz
  Fecha: 05/11/2025
-}

-- | 1. Funciones a usar
-- Aquí defino tres funciones muy simples que serán las que voy a pasar
-- como parámetros a otra función. Todas trabajan con números enteros.
sumar :: Int -> Int -> Int
sumar x y = x + y

multiplicar :: Int -> Int -> Int
multiplicar x y = x * y

elevarAlCuadradoDeLaSuma :: Int -> Int -> Int
-- Esta primero suma x e y, y luego eleva el resultado al cuadrado.
elevarAlCuadradoDeLaSuma x y = (x + y) * (x + y)

-- | 2. Función de orden superior
-- Esta función llamada ‘aplicarOperacion’ es la que recibe otra función como
-- parámetro (por ejemplo, sumar o multiplicar). Así, dependiendo de qué función
-- le pasemos, el comportamiento cambia sin modificar el código interno.
--
-- Tipo: (Int -> Int -> Int) -> Int -> Int -> Int
-- Esto significa que recibe una función que toma dos Int y devuelve un Int,
-- y también recibe dos enteros más (a y b).
aplicarOperacion :: (Int -> Int -> Int) -> Int -> Int -> Int
aplicarOperacion f a b = f a b
-- En una línea: aplica la función que se recibió (‘f’) a los valores ‘a’ y ‘b’.

-- | 3. Función principal (main)
-- Aquí solo muestro ejemplos de cómo usar la función ‘aplicarOperacion’
-- pasando diferentes funciones como parámetro. 
main :: IO ()
main = do
  let num1 = 10
      num2 = 5

  putStrLn $ "--- Demostración: Paso de Funciones como Parámetros en Haskell ---"
  putStrLn $ "Valores usados: a = " ++ show num1 ++ ", b = " ++ show num2
  putStrLn "-------------------------------------------------------------------"

  -- Paso la función ‘sumar’ como parámetro
  let resultadoSuma = aplicarOperacion sumar num1 num2
  putStrLn $ "1. Usando 'sumar': " ++ show num1 ++ " + " ++ show num2 ++ " = " ++ show resultadoSuma

  -- Ahora paso ‘multiplicar’
  let resultadoMultiplicacion = aplicarOperacion multiplicar num1 num2
  putStrLn $ "2. Usando 'multiplicar': " ++ show num1 ++ " * " ++ show num2 ++ " = " ++ show resultadoMultiplicacion

  -- Finalmente, paso ‘elevarAlCuadradoDeLaSuma’
  let resultadoCuadrado = aplicarOperacion elevarAlCuadradoDeLaSuma num1 num2
  putStrLn $ "3. Usando 'elevarAlCuadradoDeLaSuma': (" ++ show num1 ++ " + " ++ show num2 ++ ")^2 = " ++ show resultadoCuadrado

  putStrLn "-------------------------------------------------------------------"
  putStrLn "Este ejemplo muestra que en Haskell las funciones se pueden pasar como si fueran datos."
