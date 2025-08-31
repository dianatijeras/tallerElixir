defmodule Main do
  @moduledoc """
  Módulo principal del programa de cálculo de costo de envío.
  Se encarga de solicitar los datos al usuario, calcular el costo
  y mostrar el resultado.
  """

  @doc """
  Ejecuta el flujo principal del programa:
  - Pide nombre del cliente, peso y tipo de envío.
  - Calcula el costo según el tipo.
  - Muestra los datos y el costo total.
  Retorna una tupla con la información ingresada y calculada.
  """
  def run do
    # Ingresar nombre del cliente
    cliente = Util.input("Ingrese el nombre del cliente:", :string)

    # Ingresar peso del paquete en kg
    peso = Util.input("Ingrese el peso del paquete en kg:", :float)

    # Ingresar tipo de envío
    tipo_envio = Util.input("Ingrese el tipo de envío (economico, express, internacional):", :string)

    # Calcular costo
    costo_total = Util.calcular_costo(tipo_envio, peso)

    # Retornar y mostrar la tupla con los datos
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
