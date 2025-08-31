defmodule Main do
  @moduledoc """
  calcula el valor total de inventario de un libro.
  """

  @doc """
  Solicita título, unidades y precio al usuario.
  Calcula el valor total de inventario.
  Muestra los resultados o errores.
  """
  def run do
    titulo = Util.input("Ingrese el título del libro:", :string)
    unidades = Util.input("Ingrese la cantidad de unidades disponibles:", :integer)
    precio = Util.input("Ingrese el precio unitario:", :float)

    case Util.calcular_inventario(unidades, precio) do
      {:error, msg} ->
        Util.show_message("Error: #{msg}")

      total ->
        # Formateamos el precio con separadores de miles
        precio_fmt = :erlang.float_to_binary(precio, decimals: 2)
        total_fmt = :erlang.float_to_binary(total, decimals: 2)

        Util.show_message("""
        El libro "#{titulo}" tiene #{unidades} unidades,
        con un precio unitario de $#{precio_fmt}
        y un valor total de inventario de $#{total_fmt}.
        """)
    end
  end
end

Main.run()
