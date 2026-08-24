# Webhook API Server

A small [adnanh/webhook](https://github.com/adnanh/webhook) service with four token-protected hooks.

## Hooks

All hooks are available at `http://localhost:9000/hooks/<id>` and require the `X-api-key` header.

| Hook | Request body | Purpose |
| --- | --- | --- |
| `metrics` | Any valid JSON | Appends the payload to `data/metrics.jsonl` |
| `whoami` | `{"expected_ip":"203.0.113.10"}` | Compares the expected IP with the request IP |
| `8ball` | `{"question":"Will it work?"}` | Returns a random Magic 8-Ball answer |
| `roast` | `{"target":"my-service"}` | Returns a random roast and records it in `data/roast_log.json` |

Example:

```bash
curl -X POST http://localhost:9000/hooks/8ball \
  -H "X-api-key: $WEBHOOK_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"question":"Will it work?"}'
```

## Configuration

1. Copy `.env.example` to `.env`.
2. Set `WEBHOOK_API_TOKEN` to a secret value.
3. Ensure the `webhook` user can execute the scripts and write to `data/`.

The hook definitions are in `config/hooks.json`. The service listens on port `9000` and runs from `/opt/webhook`.

## Run With systemd

Install and start the service:

```bash
sudo cp api-server.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now api-server.service
```

View service status and logs:

```bash
sudo systemctl status api-server.service
sudo journalctl -u api-server.service -f
```

## Data

Runtime output is stored in `data/`:

- `metrics.jsonl` stores accepted metrics payloads.
- `whoami_log.json` stores the latest IP comparison.
- `roast_log.json` stores up to the latest 100 roast entries.
- `telemetry.jsonl` is reserved for telemetry output.