defmodule Util do
  @moduledoc """
  Funciones auxiliares para manejo de entrada/salida de datos
  y cálculo del salario total de un empleado usando cuadros de diálogo Java.
  """

  @doc """
  Muestra un mensaje en un cuadro de diálogo.
  """
  def mostrar(message) do
    System.cmd("java", ["-cp", ".", "Mensaje", message])
  end

  @doc """
  Solicita texto al usuario y retorna un string.
  Reintenta en caso de error.
  """
  def input(message, :string) do
    try do
      System.cmd("java", ["-cp", ".", "Mensaje", "input", message])
      |> elem(0)
      |> String.trim()
    rescue
      e in ArgumentError ->
        mostrar("Error al leer texto: #{e.message}")
        input(message, :string) # vuelve a pedirlo
    end
  end

  @doc """
  Solicita un número flotante al usuario.
  Retorna un float. Reintenta si la entrada es inválida.
  """
  def input(message, :float) do
    try do
      System.cmd("java", ["-cp", ".", "Mensaje", "input", message])
      |> elem(0)
      |> String.trim()
      |> String.to_float()
    rescue
      ArgumentError ->
        mostrar("Error: Debe ingresar un número válido (ej. 25.5)")
        input(message, :float) # vuelve a pedirlo
    end
  end

  @doc """
  Solicita un número entero al usuario.
  Retorna un integer. Reintenta si la entrada es inválida.
  """
  def input(message, :integer) do
    try do
      System.cmd("java", ["-cp", ".", "Mensaje", "input", message])
      |> elem(0)
      |> String.trim()
      |> String.to_integer()
    rescue
      ArgumentError ->
        mostrar("Error: Debe ingresar un número entero válido (ej. 10)")
        input(message, :integer)
    end
  end

  @doc """
  Calcula el salario total de un empleado.
  Cada hora extra se paga al 1.5x del valor de una hora normal.
  - Retorna el salario total si los valores son positivos.
  - Retorna {:error, msg} si hay valores negativos.
  """
  def calcular_salario_total(_nombre, salario_base, horas_extras)
      when salario_base >= 0 and horas_extras >= 0 do
    valor_hora = salario_base / 160
    extras = horas_extras * valor_hora * 1.5
    salario_total = salario_base + extras
    salario_total
  end

  def calcular_salario_total(_nombre, salario_base, horas_extras)
      when salario_base < 0 or horas_extras < 0 do
    {:error, "El salario base y las horas extras deben ser valores positivos"}
  end
end
