curl "https://api.heybuzzai.com/v1/chat/completions" \
  -H "Authorization: Bearer $BUZZAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "Qwen3.8-27B",
    "messages": [{"role": "user", "content": "Write tests for utils/date.py"}]
  }'
