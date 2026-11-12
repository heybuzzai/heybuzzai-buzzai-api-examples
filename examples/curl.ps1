$body = @{
  model    = "Qwen3.8-27B"
  messages = @(@{ role = "user"; content = "Write tests for utils/date.py" })
} | ConvertTo-Json -Depth 5

Invoke-RestMethod "https://api.heybuzzai.com/v1/chat/completions" -Method Post `
  -Headers @{ Authorization = "Bearer $env:BUZZAI_API_KEY" } `
  -ContentType "application/json" -Body $body
