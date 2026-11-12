# COMO INSTALAR

## 1. Instalar o Phonon TTS

1. Baixe o Phonon TTS no repositório oficial:  
   [https://github.com/gradium-ai/xn-ptts/releases/](https://github.com/gradium-ai/xn-ptts/releases/)

2. Procure o arquivo para Windows com extensão `.zip`. Exemplo:  
   `ptts-0.6.0-x86_64-pc-windows-msvc.zip`

3. Extraia o conteúdo e copie o `ptts.exe` para a pasta raiz do projeto.

## 2. Baixar as configurações e modelo

1. Entre no site do [Phonon-40M-Multilingual](https://huggingface.co/gradium/phonon-40m-multilingual/tree/main) e faça login. Aceite os termos de uso para liberar o download.

2. Acesse o repositório do modelo:

   - [Phonon-40M-Multilingual](https://huggingface.co/gradium/phonon-40m-multilingual/tree/main)
   - [Phonon-40M-PT (Português)](https://huggingface.co/gradium/phonon-40m-pt/tree/main)

   > **Nota:** Se você pretende utilizar o Phonon exclusivamente em português brasileiro, pode optar pela versão PT, especializada no idioma, em vez da Multilingual. Em benchmarks de PT-BR, a versão PT apresentou aproximadamente 5% a 9% de vantagem em preferência humana e redução de erros de pronúncia, oferecendo um desempenho ligeiramente superior em português. Caso precise utilizar outros idiomas, escolha a versão Multilingual.

3. Baixe os seguintes arquivos do modelo escolhido:

   - `config.json`
   - `tokenizer.json`
   - `model.q8.gguf`
   - `default-voice.safetensors`

4. Salve todos eles na pasta `models/`.

## 3. Baixar as vozes

1. Entre no site [Phonon Voices](https://huggingface.co/gradium/phonon-voices) e faça login. Aceite os termos de uso para liberar o acesso ao repositório.

2. Clone o repositório das vozes:

   ```bash
   git clone https://huggingface.co/gradium/phonon-voices
   ```

3. Entre na pasta clonada (`phonon-voices`) e copie apenas a pasta `voices/` para a pasta raiz do projeto.

   > Os exemplos em `samples/` são opcionais e podem ser ignorados.

## 4. Baixar o FFmpeg

1. Baixe a versão *Essential Build* do FFmpeg pelo site:  
   [https://ffmpeg.org/download.html](https://ffmpeg.org/download.html)

   Procure pela opção fornecida por `gyan.dev`.

2. Extraia o arquivo. Dentro da pasta extraída (ex.: `ffmpeg-2026-10-29-git-31ba826726-essentials_build`), localize o `ffmpeg.exe`.

3. Copie apenas o `ffmpeg.exe` para a pasta raiz do projeto.

## Exemplo de estrutura final esperada

```plaintext
C:/Phonon/
├── ptts.exe
├── ffmpeg.exe
├── voices/
└── models/
    ├── config.json
    ├── tokenizer.json
    ├── model.q8.gguf
    └── default-voice.safetensors
```
