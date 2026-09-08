# elixir-actor-cluster

Distributed actor framework with OTP GenServer workers and supervision trees in Elixir.

## Architecture
- **Fault Tolerance**: Dynamic restart policies via `:one_for_one` supervision trees.
- **Global Naming**: Distributed actor resolution across Elixir cluster nodes.
