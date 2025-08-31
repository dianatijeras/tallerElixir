defmodule Main do
  @moduledoc """
  Programa para calcular el rendimiento de combustible de un conductor.
  """

  @doc """
  Ejecuta el programa:
  - Solicita nombre, distancia y litros al usuario.
  - Calcula el rendimiento.
  - Muestra los resultados o un mensaje de error.
  """
  def run do
    # Pedir datos usando tu clase Java (cuadros de texto)
    nombre = Util.input("Ingrese el nombre del conductor:", :string)
    distancia = Util.input("Ingrese la distancia recorrida (km):", :float)
    litros = Util.input("Ingrese el combustible consumido (L):", :float)

    # Calcular rendimiento
    case Util.calcular_rendimiento(distancia, litros) do
      {:error, msg} ->
        Util.show_message("Error: #{msg}")

      rendimiento ->
        # Mostrar resultados con 2 decimales
        Util.show_message("""
        Resultados:
        Conductor: #{nombre}
        Distancia: #{Float.round(distancia, 2)} km
        Combustible: #{Float.round(litros, 2)} L
        Rendimiento: #{Float.round(rendimiento, 2)} km/L
        """)
    end
  end
end

# Ejecutar el programa
Main.run()
