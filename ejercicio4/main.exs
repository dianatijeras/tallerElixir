
defmodule Main do
  @moduledoc """
  Módulo principal de cálculo de salarios de un empleado.
  """
  def run do
    # 1. Pedir el nombre del empleado (texto)
    nombre =
      Util.input("Ingrese el nombre del empleado:", :string)

    # 2. Pedir el salario base (real)
    salario_base =
      Util.input("Ingrese el salario base:", :float)

    # 3. Pedir las horas extras trabajadas (entero)
    horas_extras =
      Util.input("Ingrese el número de horas extras trabajadas:", :integer)

    # 4.Calcular el salario total usando el módulo Util
    case Util.calcular_salario_total(nombre, salario_base, horas_extras) do
      {:error, mensaje} ->
        # Si hay error, mostrar el mensaje
        Util.mostrar(mensaje)

      total ->
        # Mostrar el resultado del cálculo
        Util.mostrar("El salario total de #{nombre} es de $#{total}")
    end
  end
end

# Ejecutar el programa
Main.run()
