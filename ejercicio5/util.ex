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
  Calcula la tarifa según el tipo de vehículo y su peso.
  - Carro: $10,000
  - Moto: $5,000
  - Camión: $20,000 + $2,000 por tonelada adicional
  Retorna el valor de la tarifa final.
  """
  def calcular_tarifa("carro", _peso), do: 10_000
  def calcular_tarifa("moto", _peso), do: 5_000

  def calcular_tarifa("camion", peso) when is_float(peso) or is_integer(peso) do
    20_000 + trunc(peso) * 2_000
  end

  def calcular_tarifa(_, _), do: 0 # en caso de tipo inválido
end
