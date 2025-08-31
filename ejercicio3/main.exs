defmodule Main do
  @moduledoc """
  Módulo principal del programa de conversión de temperaturas.
  """

  def run do
    # 1. Pedir el nombre del usuario
    nombre = Util.input("Ingrese su nombre:", :string)

    # 2. Pedir la temperatura en Celsius
    celsius = Util.input("Ingrese la temperatura en °C:", :float)

    # 3. Conversiones
    fahrenheit = Util.convertir_a_fahrenheit(celsius)
    kelvin = Util.convertir_a_kelvin(celsius)

    # 4. Mostrar resultados con 1 decimal de precisión
    Util.show_message("""
    #{nombre}, la temperatura es:
    - #{Float.round(fahrenheit, 1)} °F
    - #{Float.round(kelvin, 1)} K
    """)
  end
end

# Ejecutar el programa
Main.run()
