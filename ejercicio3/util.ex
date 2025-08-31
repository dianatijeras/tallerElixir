defmodule Util do
  @moduledoc """
  Módulo utilitario que maneja la interacción con el usuario
  mediante cuadros de texto Java y funciones auxiliares.
  """

  @doc """
  Muestra un mensaje en un cuadro de diálogo usando la clase Java `Mensaje`.
  """
  def show_message(message) do
    System.cmd("java", ["-cp", ".", "Mensaje", message])
  end

  @doc """
  Solicita al usuario una entrada de tipo texto (string).
  Usa `try/rescue` para manejar errores en la captura.
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
  Solicita al usuario una entrada de tipo real (float).
  Usa `try/rescue` para manejar errores y vuelve a pedir si hay un fallo.
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
  Convierte una temperatura en Celsius a Fahrenheit.
  """
  def convertir_a_fahrenheit(celsius) when is_float(celsius) or is_integer(celsius) do
    (celsius * 9 / 5) + 32
  end

  @doc """
  Convierte una temperatura en Celsius a Kelvin.
  """
  def convertir_a_kelvin(celsius) when is_float(celsius) or is_integer(celsius) do
    celsius + 273.15
  end
end
