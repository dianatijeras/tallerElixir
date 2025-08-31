defmodule Util do
  @moduledoc """
  Módulo utilitario para el registro de vehículos en un peaje.
  Maneja interacción con el usuario mediante cuadros de diálogo Java
  y cálculo de tarifas según el tipo de vehículo y peso.
  """

  @doc """
  Muestra un mensaje en un cuadro de diálogo Java.
  """
  def show_message(message) do
    System.cmd("java", ["-cp", ".", "Mensaje", message])
  end

  @doc """
  Solicita al usuario un texto (string).
  Reintenta en caso de error usando `try/rescue`.
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
  Valida la entrada y vuelve a pedir si no es válida.
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
  Calcula la tarifa según el tipo de vehículo y peso:
    - Carro: $10,000
    - Moto: $5,000
    - Camión: $20,000 + $2,000 por tonelada adicional
  Retorna 0 si el tipo de vehículo es inválido.
  """
  def calcular_tarifa("carro", _peso), do: 10_000
  def calcular_tarifa("moto", _peso), do: 5_000

  def calcular_tarifa("camion", peso) when is_float(peso) or is_integer(peso) do
    20_000 + trunc(peso) * 2_000
  end

  def calcular_tarifa(_, _), do: 0 # en caso de tipo inválido
end
