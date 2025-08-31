defmodule Util do
  @moduledoc """
  Módulo utilitario que gestiona la interacción con el usuario mediante
  cuadros de texto en Java y provee funciones de apoyo para conversiones.
  """

  @doc """
  Muestra un mensaje en un cuadro de diálogo Java.
  """
  def show_message(message) do
    System.cmd("java", ["-cp", ".", "Mensaje", message])
  end

  @doc """
  Solicita al usuario un texto (string).
  Usa `try/rescue` para manejar errores y repite en caso de fallo.
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
  Solicita al usuario un número real (float).
  Valida la entrada con `try/rescue` y vuelve a pedir si es inválida.
  """
  def input(message, :float) do
    try do
      System.cmd("java", ["-cp", ".", "Mensaje", "input", message])
      |> elem(0)
      |> String.trim()
      |> String.to_float()
    rescue
      ArgumentError ->
        show_message("Error: Debe ingresar un número válido (ej. 25.5)")
        input(message, :float) # vuelve a pedirlo
    end
  end

  @doc """
  Convierte grados Celsius a Fahrenheit.
  """
  def convertir_a_fahrenheit(celsius) when is_float(celsius) or is_integer(celsius) do
    (celsius * 9 / 5) + 32
  end

  @doc """
  Convierte grados Celsius a Kelvin.
  """
  def convertir_a_kelvin(celsius) when is_float(celsius) or is_integer(celsius) do
    celsius + 273.15
  end
end
