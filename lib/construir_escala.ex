defmodule ConstruirEscala do
  @moduledoc """
  Módulo para construir escalas semanais a partir de uma data inicial.
  """
  @default_weeks 52

  @doc """
  Constrói uma lista de tuplas representando intervalos semanais.

  ## Exemplos

      iex> ConstruirEscala.build(~D[2026-01-06], 2)
      [{~D[2026-01-06], ~D[2026-01-12]}, {~D[2026-01-13], ~D[2026-01-19]}]

  """
  def build(start_date, weeks \\ @default_weeks) do
    total_days = weeks * 7

    Date.range(start_date, Date.add(start_date, total_days - 1), 7)
    |> Enum.map(fn date ->
      {date, Date.add(date, 6)}
    end)
  end

  @doc """
  Imprime as escalas no formato CSV.

  ## Exemplos

      iex> ConstruirEscala.print(~D[2026-01-06], 1)
      # Imprime: 2026-01-06,à,2026-01-12

  """
  def print(start_date, weeks \\ @default_weeks) do
    build(start_date, weeks)
    |> Enum.each(fn {inicio, fim} ->
      IO.puts("#{inicio},à,#{fim}")
    end)
  end
end
