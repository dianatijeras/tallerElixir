defmodule Main do
  @moduledoc """
  Módulo principal que gestiona la ejecución del programa de conversión de temperaturas.
  """

  @doc """
  Inicia la aplicación:
    1. Solicita el nombre y la temperatura en Celsius al usuario.
    2. Convierte la temperatura a Fahrenheit y Kelvin.
    3. Muestra los resultados con un decimal de precisión.
  """
  def run do
    # Pedir el nombre del usuario
    nombre = Util.input("Ingrese su nombre:", :string)

    # Pedir la temperatura en Celsius
    celsius = Util.input("Ingrese la temperatura en °C:", :float)

    # Conversiones
    fahrenheit = Util.convertir_a_fahrenheit(celsius)
    kelvin = Util.convertir_a_kelvin(celsius)

    # Mostrar resultados con 1 decimal de precisión
    Util.show_message("""
    #{nombre}, la temperatura es:
    - #{Float.round(fahrenheit, 1)} °F
    - #{Float.round(kelvin, 1)} K
    """)
  end
end

# Ejecutar el programa
Main.run()
