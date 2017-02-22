# hybrid
System-wide hybrid emacs/vim keybindings for macOS.

## Status
This repo is currently a work in progress. Contributions are welcome!

*Unfortunately, due to being in a school term right now, I'm making slow progress on this, but I hope to have most of the emacs keybindings implemented soon since Mac already has some by default.*

### Emacs
#### Movement
| Keybinding    | Description                | Implemented             |
| :-----------: | -------------------------- |:-----------------------:|
| C-f           | move forward a character   | :ballot_box_with_check: |
| C-b           | move backwards a character | :ballot_box_with_check: |
| C-a           | move to end of line        | :ballot_box_with_check: |
| C-e           | move to start of line      | :ballot_box_with_check: |
| M-f           | move forward a word        | :ballot_box_with_check: |
| M-b           | move backwards a word      | :ballot_box_with_check: |
| M-}           | move forward a paragraph   | :ballot_box_with_check: |
| M-{           | move backwards a paragraph | :ballot_box_with_check: |

#### Deletion
| Keybinding    | Description                | Implemented             |
| :-----------: | -------------------------- |:-----------------------:|
| C-d           | delete character forward   | :ballot_box_with_check: |
| DEL           | delete character backwards | :ballot_box_with_check: |
| M-d           | delete word forward        | :ballot_box_with_check: |
| M-DEL         | delete word backwards      | :ballot_box_with_check: |
| C-k           | delete to EOL              | :ballot_box_with_check: |

### Vim
#### Movement
| Mode   | Keybinding    | Description                | Implemented             |
| :----: | :-----------: | -------------------------- |:-----------------------:|
| Normal | h             | move backwards a character | :ballot_box_with_check: |
| Normal | l             | move forward a character   | :ballot_box_with_check: |
| Normal | k             | move cursor up a line      | :ballot_box_with_check: |
| Normal | j             | move cursor down a line    | :ballot_box_with_check: |
| Normal | ^             | move to start of line      | :ballot_box_with_check: |
| Normal | $             | move to end of line        | :ballot_box_with_check: |
| Normal | b             | move backwards a word      | :ballot_box_with_check: |
| Normal | e, w          | move forward a word        | :ballot_box_with_check: |

## Motivation
The motivation behind this repo is that I get annoyed when I can't use vim or emacs keybindings in my daily computer use.
This lua script for hammerspoon was made to provide system-wide, vim and emacs keybindings akin to those offered in [spacemacs](http://spacemacs.org/).

`insert-mode` for vim has all of the emacs keybindings by default. Pressing `esc` in this mode will let you enter the modal `normal-mode` for vim.

## Usage
1. Download hammerspoon: http://www.hammerspoon.org/.
2. Clone this repo in your `~/.hammerspoon` directory.
3. Add `require "hybrid"` to your init.lua file.
4. Press `cmd` + `esc` to enter hybrid-mode when hammerspoon is running.
