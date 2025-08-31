defmodule Main do
  @moduledoc """
  Módulo principal del programa de Cálculo de Costo de Envío.
  Se encarga de pedir los datos al usuario, calcular el costo
  y mostrar el resultado final.
  """

  def run do
    # 1. Ingresar nombre del cliente
    cliente = Util.input("Ingrese el nombre del cliente:", :string)

    # 2. Ingresar peso del paquete en kg
    peso = Util.input("Ingrese el peso del paquete en kg:", :float)

    # 3. Ingresar tipo de envío
    tipo_envio = Util.input("Ingrese el tipo de envío (economico, express, internacional):", :string)

    # 4. Calcular costo
    costo_total = Util.calcular_costo(tipo_envio, peso)

    # 5. Retornar y mostrar la tupla con los datos
    resultado = {cliente, peso, tipo_envio, costo_total}

    Util.show_message("""
    Cliente: #{cliente}
    Peso: #{peso} kg
    Tipo de envío: #{tipo_envio}
    Costo total: $#{costo_total}
    """)

    resultado
  end
end

# Ejecutar el programa
Main.run()
