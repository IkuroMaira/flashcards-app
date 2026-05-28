# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Start dev server (Rails + Tailwind watcher)
bin/dev

# Run all tests
bin/rails test

# Run a single test file
bin/rails test test/models/deck_test.rb

# Run a single test by line number
bin/rails test test/models/deck_test.rb:10

# Lint
bin/rubocop

# Security scan
bin/brakeman

# Database
bin/rails db:migrate
bin/rails db:seed
```

## Stack

- **Rails 8** with Ruby 3.3.6
- **PostgreSQL** — configured in `config/database.yml`
- **Tailwind CSS** via `tailwindcss-rails` (no Node/npm; uses importmap + propshaft)
- **Hotwire** (Turbo + Stimulus) for interactivity
- **Solid Queue / Cache / Cable** — database-backed adapters (no Redis needed)
- **Rubocop** with `rubocop-rails-omakase` style (Rails' default opinionated style)

## Architecture

The app is a flashcard review tool. Core domain:

- **Deck** — a named collection of cards (`has_many :cards, dependent: :destroy`)
- **Card** — belongs to a deck; has `question`, `answer`, and `category` fields

Routes follow standard Rails REST with one nested singular resource:
```
resources :decks do
  resource :review, only: :show   # GET /decks/:deck_id/review
end
```

**Review flow** (`ReviewsController#show`): stateless, position-based navigation via query params. The `?position=N` param selects the current card (clamped to valid range); `?reveal=true` reveals the answer. Turbo Frames wrap the card content to enable partial-page updates without a full reload.

## Conventions

- Views are ERB with Tailwind utility classes; no separate CSS files.
- No authentication currently — all routes are public.
- Tests use Rails' built-in Minitest with fixtures (not factories).
