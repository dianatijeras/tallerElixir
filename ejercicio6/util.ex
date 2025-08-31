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
        show_message("Error: Debe ingresar un número válido (ej. 3.5)")
        input(message, :float) # vuelve a pedirlo
    end
  end

  @doc """
  Calcula el costo de envío según el tipo de envío y el peso del paquete.
  Usa `if`, `cond` y `case` con pattern matching.
  Retorna el costo total como número.
  """
  def calcular_costo(tipo, peso) when is_float(peso) or is_integer(peso) do
    case tipo do
      "economico" ->
        peso * 5000

      "express" ->
        peso * 8000

      "internacional" ->
        cond do
          peso <= 5 ->
            peso * 15000

          peso > 5 ->
            peso * 12000
        end

      _ ->
        show_message("Tipo de envío no válido. Se cobrará 0.")
        0
    end
  end
end
