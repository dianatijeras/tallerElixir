defmodule Main do
  @moduledoc """
  Módulo principal para el registro de vehículos en un peaje.
  Solicita los datos del vehículo y muestra la tarifa correspondiente.
  """
  @doc """
  Flujo principal del programa:
    1. Solicita placa, tipo y peso del vehículo.
    2. Calcula la tarifa según el tipo y peso.
    3. Muestra el resultado en un cuadro de diálogo.
  """
  def run do
    # Ingresar placa
    placa = Util.input("Ingrese la placa del vehículo:", :string)

    # Ingresar tipo de vehículo
    tipo = Util.input("Ingrese el tipo de vehículo (carro, moto, camion):", :string)

    # Ingresar peso del vehículo
    peso = Util.input("Ingrese el peso del vehículo en toneladas:", :float)

    # Calcular tarifa
    tarifa = Util.calcular_tarifa(tipo, peso)

    # Mostrar resultado
    Util.show_message("""
    Vehículo #{placa} (#{tipo}) debe pagar $#{tarifa}.
    """)
  end
end

# Ejecutar el programa
Main.run()
