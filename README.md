# Construir Escala

Uma ferramenta simples para gerar escalas semanais a partir de uma data inicial.

## Uso

```bash
construir_escala YYYY-MM-DD [semanas]
```

### Exemplos

```bash
# Gera 52 semanas (padrão) a partir de 2026-01-06
construir_escala 2026-01-06

# Gera 10 semanas a partir de 2026-01-06
construir_escala 2026-01-06 10
```

### Saída

O programa imprime as escalas no formato CSV:
```
2026-01-06,à,2026-01-12
2026-01-13,à,2026-01-19
...
```

## Desenvolvimento

### Requisitos

- Elixir ~> 1.14
- Mix

### Instalação de Dependências

```bash
mix deps.get
```

### Compilação

```bash
mix compile
```

### Executar Localmente

```bash
mix escript.build
./construir_escala 2026-01-06
```

## Construir Binário para Windows

Para criar um binário standalone para Windows:

```bash
mix deps.get
MIX_ENV=prod mix burrito.build
```

O binário será gerado em `burrito_out/construir_escala.exe` e pode ser distribuído diretamente para usuários Windows. O arquivo `.exe` é completamente standalone e não requer Erlang ou Elixir instalados.

**Nota:** O binário gerado pelo Burrito será nomeado `construir_escala_windows.exe`, mas será automaticamente renomeado para `construir_escala.exe` no processo de release do GitHub Actions.

### Nota sobre Build Cross-Platform

O Burrito suporta builds cross-platform. Para construir o binário Windows a partir de macOS/Linux, você pode precisar de configuração adicional ou usar Docker. Consulte a [documentação do Burrito](https://github.com/burrito-elixir/burrito) para mais detalhes sobre builds cross-platform.

Alternativamente, você pode construir o binário diretamente em uma máquina Windows executando os mesmos comandos.

## Licença

Este projeto é de código aberto e está disponível sob a licença MIT.

