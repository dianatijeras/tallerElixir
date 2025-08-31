defmodule Util do
  @moduledoc """
  Modulo para mostrar mensajes usando Java
  """

  @doc """
  Muestra un mensaje al usuario usando un cuadro de diálogo Java.
  """
  def show_message(message) do
    System.cmd("java", ["-cp", ".", "Mensaje", message])
  end


  @doc """
  Solicita un texto al usuario usando un cuadro de diálogo Java.
  """
  def input(message, :string) do
    try do
      System.cmd("java", ["-cp", ".", "Mensaje", "input", message])
      |> elem(0)
      |> String.trim()
    rescue
      e in ArgumentError ->
        show_message("Error al leer texto: #{e.message}")
        input(message, :string)
    end
  end


  @doc """
  Solicita un número entero al usuario usando un cuadro de diálogo Java.
  """
  def input(message, :integer) do
    try do
      System.cmd("java", ["-cp", ".", "Mensaje", "input", message])
      |> elem(0)
      |> String.trim()
      |> String.to_integer()
    rescue
      ArgumentError ->
        show_message("Error: Debe ingresar un número entero válido (ej. 10)")
        input(message, :integer)
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
        show_message("Error: Debe ingresar un número válido (ej. 120000.50)")
        input(message, :float)
    end
  end


  @doc """
  Calcula el valor total de inventario dados las unidades y el precio unitario.
  """
  def calcular_inventario(unidades, precio) when unidades >= 0 and precio >= 0 do
    unidades * precio
  end

  def calcular_inventario(unidades, precio) when unidades < 0 or precio < 0 do
    {:error, "Las unidades y el precio deben ser valores positivos"}
  end
end
