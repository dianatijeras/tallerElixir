defmodule Util do
  @moduledoc """
  Modulo para mostrar mensajes usando Java
  """

  @doc """
  Muestra un mensaje usando un cuadro de diálogo en Java
  """
  def show_message(message) do
    System.cmd("java", ["-cp", ".", "Mensaje", message])
  end


  @doc """
  Pide texto al usuario usando un cuadro Java.
  """
  def input(message, :string) do
    try do
      System.cmd("java", ["-cp", ".", "Mensaje", "input", message])
      |> elem(0)
      |> String.trim()
    rescue
      e in ArgumentError ->
        show_message("Error al leer texto: #{e.message}")
        input(message, :string) # vuelve a pedirlo

    end
  end


  @doc """
  Solicita un número flotante al usuario usando un cuadro de diálogo Java.
  """
  def input(message, :float) do
    try do
      System.cmd("java", ["-cp", ".", "Mensaje", "input", message])
      |> elem(0)
      |> String.trim()
      |> String.to_float()
    rescue
      ArgumentError ->
        show_message("Error: Debe ingresar un número válido (ej. 12.5)")

        input(message,:float) # Vuelve a pedir el dato
    end
  end

  @doc """
  Calcula el rendimiento (km/L) dados la distancia y los litros consumidos.
  """
  # Cálculo de rendimiento (con guardas para validar que litros > 0)
  def calcular_rendimiento(distancia, litros) when litros > 0 do
    distancia / litros
  end

  def calcular_rendimiento(_distancia, litros) when litros <= 0 do
    {:error, "La cantidad de litros debe ser mayor a 0"}
  end

end
