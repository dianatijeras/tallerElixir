
defmodule Main do
  @moduledoc """
  Módulo principal para calcular el salario total de un empleado,
  incluyendo horas extras.
  """
  @doc """
  Flujo principal del programa:
    1. Solicita nombre, salario base y horas extras al usuario.
    2. Calcula el salario total con `Util.calcular_salario_total/3`.
    3. Muestra el resultado o un mensaje de error.
  """
  def run do
    # Pedir el nombre del empleado (texto)
    nombre =
      Util.input("Ingrese el nombre del empleado:", :string)

    # Pedir el salario base (real)
    salario_base =
      Util.input("Ingrese el salario base:", :float)

    # Pedir las horas extras trabajadas (entero)
    horas_extras =
      Util.input("Ingrese el número de horas extras trabajadas:", :integer)

    # Calcular el salario total usando el módulo Util
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
