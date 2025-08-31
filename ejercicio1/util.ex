defmodule Util do
  @moduledoc """
  Funciones auxiliares para interacción con el usuario y cálculo de rendimiento.
  Usa cuadros de diálogo en Java para entrada y salida.
  """

  @doc """
  Muestra un mensaje en un cuadro de diálogo.
  """
  def show_message(message) do
    System.cmd("java", ["-cp", ".", "Mensaje", message])
  end

  @doc """
  Solicita texto al usuario.
  Retorna un string. Reintenta si hay error.
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
  Solicita un número flotante al usuario.
  Retorna un float. Reintenta si hay error.
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
  Calcula el rendimiento (km/L).
  - Retorna un float si litros > 0.
  - Retorna {:error, msg} si litros <= 0.
  """
  # Cálculo de rendimiento (con guardas para validar que litros > 0)
  def calcular_rendimiento(distancia, litros) when litros > 0 do
    distancia / litros
  end

  def calcular_rendimiento(_distancia, litros) when litros <= 0 do
    {:error, "La cantidad de litros debe ser mayor a 0"}
  end

end
