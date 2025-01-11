# Daily Committer #
## [Versão em Português](#portugues)

2025 i promised to myself i would commit at least once a day and i failed hard, so i did the next best thing and made this, ofc
`dailyCommiter.sh` is a bash script that automates the process of committing changes to a Git repository at a specified frequency. It can also be scheduled to run at regular intervals using cron jobs.

## Features

- Automatically commits changes to a Git repository.
- Allows specifying a custom file path for storing commit messages.
- Supports setting the frequency of commits per day.
- Can add or remove the script from cron jobs.

if the quotes file gets too big just delete it to get a free commit lol

## Usage

### Command-line Options

- `-r`: Remove the script from cron jobs.
- `-f <file_path>`: Specify a custom file path for storing commit messages.
- `-t <frequency>`: Set the frequency of commits per day (e.g., `-t 2` for twice per day). It always runs once on reboot
- `-c`: Commit to file.
- `-h`: Help.



### Examples

1. **Run the script with default settings to start 10xIng:**
    ```bash
    bash dailyCommiter.sh
    ```

2. **Specify a custom file path for the output:**
    ```bash
    bash dailyCommiter.sh -f /path/to/another/file.txt
    ```

3. **Set the frequency of commits to twice per day:**
    ```bash
    bash dailyCommiter.sh -t 2
    ```

4. **Remove the script from cron jobs:**
    ```bash
    bash dailyCommiter.sh -r
    ```

## Installation

1. **Fork the repository(youd like to have it private aswell hah):**
    ```bash
    git clone https://github.com/urUser/daily-commiter
    cd dailyCommiter
    ```
1.1. **Install crontab using ur package managers:**

- **Using apt (Debian/Ubuntu):**
    ```bash
    sudo apt update
    sudo apt install cron
    ```

- **Using yum (CentOS/RHEL):**
    ```bash
    sudo yum install cronie
    sudo systemctl start crond
    sudo systemctl enable crond
    ```

- **Using dnf (Fedora):**
    ```bash
    sudo dnf install cronie
    sudo systemctl start crond
    sudo systemctl enable crond
    ```

- **Using pacman (Arch Linux):**
    ```bash
    sudo pacman -S cronie
    sudo systemctl start cronie
    sudo systemctl enable cronie
    ```

- **Using brew (macOS):**
    ```bash
    brew install cronie
    sudo brew services start cronie
    ```

2. **Make the script executable:**
    ```bash
    chmod +x dailyCommiter.sh
    ```

3. **Run the script with desired options:**
    ```bash
    ./dailyCommiter.sh [options]
    ```

3. **Run crontab to see if the job was created correctly:**
    ```bash
    crontab -l
    ```

## Cron Job

The script can be added to cron jobs to run at specified intervals. If you want to add it yourself dont forget to add the -c flag, lest you be swallowed by cronjob recursion

### Example Cron Job

To run the script twice per day:
    ```bash
    bash dailyCommiter.sh -t 2
    ```

[PT-BR]

# Portugues

Em 2025, prometi a mim mesmo que iria fazer commits pelo menos uma vez por dia e falhei miseravelmente, então fiz a próxima melhor coisa e criei isso, claro.
`dailyCommiter.sh` é um script bash que automatiza o processo de fazer commits em um repositório Git em uma frequência especificada. Ele também pode ser agendado para rodar em intervalos regulares usando cron jobs.

## Funcionalidades

- Faz commits automaticamente em um repositório Git.
- Permite especificar um caminho de arquivo personalizado para armazenar mensagens de commit.
- Suporta a definição da frequência de commits por dia.
- Pode adicionar ou remover o script dos cron jobs.

Se o arquivo de citações ficar muito grande, basta deletá-lo para ganhar um commit grátis, rs.

## Uso

### Opções de Linha de Comando

- `-r`: Remove o script dos cron jobs.
- `-f <file_path>`: Especifica um caminho de arquivo personalizado para armazenar mensagens de commit.
- `-t <frequency>`: Define a frequência de commits por dia (por exemplo, `-t 2` para duas vezes por dia). Sempre roda uma vez na reinicialização.
- `-c`: Faz commit no arquivo.
- `-h`: Ajuda.

### Exemplos

1. **Execute o script com as configurações padrão para começar a ser um 10x:**
    ```bash
    bash dailyCommiter.sh
    ```

2. **Especifique um caminho de arquivo personalizado para a saída:**
    ```bash
    bash dailyCommiter.sh -f /path/to/another/file.txt
    ```

3. **Execute o script com as opções desejadas:**
    ```bash
    ./dailyCommiter.sh [options]
    ```

3. **Execute o crontab para ver se o job foi criado corretamente:**
    ```bash
    crontab -l
    ```

## Cron Job

O script pode ser adicionado aos cron jobs para rodar em intervalos especificados. Se você quiser adicioná-lo manualmente, não se esqueça de adicionar a flag `-c`, para não ser engolido pela recursão do cronjob.

### Exemplo de Cron Job

Para rodar o script duas vezes por dia:
    ```bash
    bash dailyCommiter.sh -t 2
    ```