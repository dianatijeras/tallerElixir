defmodule Util do
  @moduledoc """
  Módulo utilitario que maneja la interacción con el usuario
  mediante cuadros de diálogo en Java y operaciones auxiliares.
  """

  @doc """
  Muestra un mensaje en un cuadro de diálogo usando la clase Java `Mensaje`.
  """
  def show_message(message) do
    System.cmd("java", ["-cp", ".", "Mensaje", message])
  end

  @doc """
  Solicita al usuario una entrada de tipo texto (string).
  En caso de error, muestra un mensaje y vuelve a pedir la entrada.
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
  En caso de error, muestra un mensaje y vuelve a pedir la entrada.
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
  Calcula el costo de envío según el tipo y el peso del paquete:
  - **Económico**: $5000 por kg
  - **Express**: $8000 por kg
  - **Internacional**:
    - hasta 5 kg → $15000 por kg
    - más de 5 kg → $12000 por kg
  Si el tipo no es válido, retorna 0.
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
