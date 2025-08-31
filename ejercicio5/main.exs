defmodule Main do
  @moduledoc """
  Módulo principal del programa de Registro de Vehículos en un Peaje.
  Se encarga de pedir los datos al usuario y mostrar el resultado final.
  """

  def run do
    # 1. Ingresar placa
    placa = Util.input("Ingrese la placa del vehículo:", :string)

    # 2. Ingresar tipo de vehículo
    tipo = Util.input("Ingrese el tipo de vehículo (carro, moto, camion):", :string)

    # 3. Ingresar peso del vehículo
    peso = Util.input("Ingrese el peso del vehículo en toneladas:", :float)

    # 4. Calcular tarifa
    tarifa = Util.calcular_tarifa(tipo, peso)

    # 5. Mostrar resultado
    Util.show_message("""
    Vehículo #{placa} (#{tipo}) debe pagar $#{tarifa}.
    """)
  end
end

# Ejecutar el programa
Main.run()
