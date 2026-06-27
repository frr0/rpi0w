-- --- OPZIONI FONDAMENTALI (SUPER LIGHT) ---
vim.opt.number = true          -- Mostra i numeri di riga
vim.opt.relativenumber = true  -- Numeri relativi (comodissimi per muoversi velocemente)
vim.opt.mouse = 'a'            -- Abilita l'uso del mouse/touchpad se serve
vim.opt.syntax = 'on'          -- Attiva la colorazione della sintassi

-- --- SPAZIATURA E TABULAZIONE ---
vim.opt.tabstop = 4            -- Un tab equivale a 4 spazi
vim.opt.shiftwidth = 4         -- Larghezza dell'indentazione automatica
vim.opt.expandtab = true       -- Trasforma i tab in spazi automaticamente
vim.opt.smartindent = true     -- Indentazione intelligente in base al linguaggio

-- --- RICERCA ---
vim.opt.ignorecase = true      -- Ignora maiuscole/minuscole nella ricerca
vim.opt.smartcase = true       -- Non ignorarle se usi una maiuscola esplicita
vim.opt.hlsearch = false       -- Non lasciare i risultati evidenziati dopo la ricerca

-- --- 📋 APPUNTI CONDIVISI CON IL PC (CLIPBOARD) ---
-- Questo dice a Neovim di usare la clipboard del sistema operativo
vim.opt.clipboard = 'unnamedplus'

-- --- COMODITÀ IN LINEA DI COMANDO ---
vim.opt.wildmenu = true        -- Menu visivo per l'autocompletamento dei comandi

-- --- COLORI E TEMA ---
vim.opt.termguicolors = true   -- Abilita i colori a 24-bit (se il tuo terminale sul ThinkPad li supporta)
vim.cmd('syntax on')           -- Forza la sintassi attiva

-- Scegli uno di questi togliendo il commento (--). Di default mettiamo 'desert'
vim.cmd('colorscheme slate') 

-- Esempi alternativi nativi molto validi (se vuoi cambiarlo, basta sostituire il nome sopra):
-- vim.cmd('colorscheme desert')  -- Più scuro, toni grigi/azzurri
-- vim.cmd('colorscheme ron')    -- Sfondo molto scuro, colori accesi
-- vim.cmd('colorscheme torte')  -- Sfondo nero puro, ottimo per risparmiare contrasto

-- Personalizzazione extra: evidenzia la riga dove si trova il cursore
vim.opt.cursorline = true
