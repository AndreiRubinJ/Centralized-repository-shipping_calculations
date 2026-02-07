# Neovim Java сборка

Эта сборка делает Neovim удобным для Java/Spring/Spring Boot, Hibernate, базы данных и дебага, с горячими клавишами в стиле IntelliJ.

## Быстрый старт

1. Установите Neovim 0.9+.
2. Запустите установщик из папки `nvim`:
   ```bash
   ./nvim/install.sh
   ```
3. Запустите Neovim. Плагины установятся автоматически через `lazy.nvim`.
4. Установите через Mason необходимые серверы и инструменты:
   ```vim
   :Mason
   ```
   Убедитесь, что установлены:
   - `jdtls`
   - `lombok`
   - `java-debug-adapter`
   - `java-test`
   - `lua-language-server`

## Что включено

### Java / Spring / Hibernate
- `nvim-jdtls` + `jdtls` — полноценный Java LSP.
- `spring-boot.nvim` — действия для Spring Boot.
- Поддержка Lombok через `lombok.jar` (Mason пакет `lombok`).

### Дебаг
- `nvim-dap`, `nvim-dap-ui`, `nvim-dap-virtual-text`.

### База данных
- `vim-dadbod`, `vim-dadbod-ui`, `vim-dadbod-completion`.

### Поиск и переходы
- `telescope.nvim` + `telescope-fzf-native` (семантический поиск/файлы/grep).

### Дерево проекта
- `nvim-tree`.

### Подсветка/автодополнение
- `nvim-treesitter` для подсветки.
- `nvim-cmp` + `LuaSnip` + `friendly-snippets` + собственные Java сниппеты.

## IntelliJ-подобные горячие клавиши

| Команда | Клавиши | Описание |
| --- | --- | --- |
| Go to File | `Ctrl+P` | Поиск файлов |
| Find in Files | `Ctrl+Shift+F` | Глобальный поиск |
| Project Tree | `Ctrl+B` | Открыть дерево проекта |
| Intentions/Actions | `Alt+Enter` | Code Actions |
| Toggle Breakpoint | `Ctrl+Shift+B` | Точка останова |
| Debug Continue | `F5` | Продолжить |
| Step Over | `F8` | Шаг через |
| Step Into | `F7` | Шаг внутрь |
| Step Out | `Shift+F8` | Шаг наружу |
| Go to Declaration | `Alt+B` | Переход к объявлению |
| Go to Implementation | `Ctrl+Alt+B` | Переход к реализации |
| Database UI | `<leader>db` | Окно базы |
| Comment Line/Block | `<leader>/` | Комментировать строку/блок |
| Build (Maven/Gradle) | `<leader>jb` | Сборка проекта |
| Debug Tests (Maven/Gradle) | `<leader>jd` | Запуск тестов с debug |

## Запуск main-класса

1. Откройте Java-файл с `main`.
2. Нажмите `<leader>jr` — создаются DAP-конфиги для main-классов и запуск начинается сразу.

## Сниппеты как в IntelliJ

- `psvm` → `public static void main(String[] args) {}`
- `sout` → `System.out.println()`
- `serr` → `System.err.println()`

## Примечания

- Для Spring Boot можно использовать команды/действия LSP и `spring-boot.nvim`.
- Для Hibernate обычно достаточно LSP и подсветки SQL/JPQL. При необходимости подключайте специфические плагины через `lazy.nvim`.
