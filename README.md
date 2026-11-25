# Plugin OBS — Multímetro JTX A9 (Windows)

Plugin para **OBS Studio 33.x (Windows 64 bits)** que mostra as leituras do
**multímetro JTX A9** dentro do OBS, em tempo real, sem capturar a janela de
nenhum programa.

![Prévia do painel](preview-meter.png)

## Download

Baixe o arquivo **[Facility-Tech-Meter-1.0.0-windows.zip](../../releases/latest)**
na aba *Releases* deste repositório.

## Instalação

1. Feche o OBS Studio.
2. Extraia o ZIP.
3. Dê duplo clique em **`instalar-windows.bat`**.
4. Abra o OBS novamente.

O instalador copia o arquivo para:

```
%APPDATA%\obs-studio\plugins\facility-tech-meter\bin\facility-tech-meter.dll
```

## Como usar

1. No OBS, clique no botão **+** na área **Fontes**.
2. Escolha **"Facility Tech Lab - Multímetro JTX A9"**.
3. Nas propriedades, selecione a **porta COM** do multímetro.
4. Clique em **Conectar multímetro**.
5. O painel passa a mostrar tensão e corrente em tempo real.

O painel é **somente leitura**: mude o modo no multímetro físico (Fonte,
Diodo, Voltagem ou USB) e o OBS acompanha automaticamente.

Para parar a leitura, clique em **Desconectar multímetro**.

## Requisitos

- Windows 10 ou 11 (64 bits)
- OBS Studio 33.x (64 bits)
- Multímetro JTX A9 conectado por USB (115200 baud)

## Arquivos

| Arquivo | Descrição |
|---|---|
| `facility-tech-meter.dll` | plugin compilado para Windows x64 |
| `instalar-windows.bat` | instalador automático |
| `preview-meter.png` | prévia do painel |

Uso livre para os técnicos que utilizam este equipamento.
