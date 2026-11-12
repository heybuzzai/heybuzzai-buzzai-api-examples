# pip install openai
import os
from openai import OpenAI

client = OpenAI(
    base_url="https://api.heybuzzai.com/v1",
    api_key=os.environ["BUZZAI_API_KEY"],
)

reply = client.chat.completions.create(
    model="Qwen3.8-27B",
    messages=[{"role": "user", "content": "Write tests for utils/date.py"}],
)
print(reply.choices[0].message.content)
